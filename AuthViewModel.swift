//
//  AuthViewModel.swift
//  CS IA
//
//  Created by CHRISTIE, Russell on 18.01.24.
//

import Foundation
import Firebase


class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var userCurrent: User?
    
    init() {
        
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        print("Sign in...")
    }
    
    func createUser(withEmail email: String, password: String,fullname: String ) async throws{
        print("Registered User")
        
    }
    
    func signout(){
        
    }
    
    func deleteAccount(){
        
    }
    
    func fetchUser() async {
        
    }
}


