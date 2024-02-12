//
//  ContentView.swift
//  CS IA
//
//  Created by CHRISTIE, Russell on 18.01.24.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @EnvironmentObject var vm: ScannerViewModel
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        switch vm.dataScannerAccessStatus{
        case.scannerAvailable:
            mainView
        case .notDetermined:
            Text("Requesting Camera Access ")
        case .cameraAccessNotGranted:
            Text("Please Grant the camera access in the settings")
        case .cameraNotAvailable:
            Text("Your camera doesnt have a camera")
        case .scannerNotAvailable:
            Text("Your camera is not compable of scanning bar codes")
        }
        
        
        
        Group{
            if viewModel.userSession != nil {
                ProfileView()
            }else{
                Login()
            }
            
        }
        
        // end of group
        
        
    }
    private var mainView: some View{
        DataScannerView(
            recognizedItems: $vm.recognizedItems, recognizedDataType:vm.recognizedDataType, recognizesMultipleItems: vm.recognizesMultipleItems)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
