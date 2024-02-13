//
//  ScannerViewModel.swift
//  CS IA
//
//  Created by CHRISTIE, Russell on 25.01.24.
//
import AVKit
import Foundation
import SwiftUI
import VisionKit

enum ScanType{
    case text, barcode
}

enum DataScannerAccessStatusType { // enum allows you to store data values that are related into a group
    
    // case is just telling swift a variable it has to check, so it will go through this list and check if each condition is met
    case notDetermined
    case cameraAccessNotGranted
    case cameraNotAvailable
    case scannerAvailable
    case scannerNotAvailable

}

@MainActor // connects it to the main queue of exectuting work i.e it links it to the core
final class ScannerViewModel: ObservableObject{
    
    @Published var dataScannerAccessStatus: DataScannerAccessStatusType = .notDetermined
    @Published var recognizedItems: [RecognizedItem] = []
    @Published var scanType: ScanType = .barcode
    @Published var textContentType: DataScannerViewController.TextContentType?
    @Published var recognizesMultipleItems = true
    
    var recognizedDataType: DataScannerViewController.RecognizedDataType{
        scanType == .barcode ?  .barcode():
            .text(textContentType: textContentType)
    }
    
    private var isScannerAvailable: Bool{
        DataScannerViewController.isAvailable && DataScannerViewController.isSupported // determines if the scanner is avaiable or not and returns a bool value of true or false true if it is else false
    }
    
    func RequestDataScannerAccessStatus() async{//  async allows for tasks to run in the background concurrently
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            dataScannerAccessStatus = .cameraNotAvailable // will display the camera and if not available the access type is set = to notavailable
            return
        }
        switch AVCaptureDevice.authorizationStatus(for: .video){ // switch functions the same as case
            
        case .authorized:
            dataScannerAccessStatus = isScannerAvailable ? .scannerAvailable: . scannerNotAvailable // if the scanner is avaiable or true it is assigned scanner is avaible and if it returns false it is assigned notavailable
        case . restricted, .denied:
            dataScannerAccessStatus = .cameraAccessNotGranted
        case .notDetermined:
            let granted = await AVCaptureDevice.requestAccess(for: .video)
            if granted {
                dataScannerAccessStatus = isScannerAvailable ? .scannerAvailable: .scannerNotAvailable
            }else{
                dataScannerAccessStatus = .cameraAccessNotGranted
            }
             
        default: break
            
        }
    }
}

