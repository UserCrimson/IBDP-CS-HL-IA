//
//  AuthViewModel.swift
//  CS IA
//
//  Created by CHRISTIE, Russell on 18.01.24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

// used to tell if the form is valid, and makes sure that login and singjup have to conform to this protocol

protocol AuthenticationFormProtocol{
    var formIsValid: Bool { get }
}



@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task{
            await fetchUser()
        }
        
    }
    
    func signIn(withEmail email: String, password: String) async throws { // throws any errors
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()//fetches the profile view with the user id, must be used after signing in so the uid can be fetched
        }catch{
            print("DEBUG: Failed to log in with error\(error.localizedDescription)")
            
        }
            }
    func createUser(withEmail email: String, password: String,fullname: String ) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email) // creating user Id and uploading it to firestore
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser() // fetches data we just uploaded
        }catch{
            print("DEBUG: Failed to create user with error\(error.localizedDescription)") // used to catch any error and output the error when
        }
        
    }
    
    func signOut(){
        do{
            try Auth.auth().signOut() // sings out user on the back end / firebase
            self.userSession = nil // takes you back to the login screen by setting the user session = 0
            self.currentUser = nil // reset the current user model
            
        }catch{
            print("DEBUG: failed to sing out with error\(error.localizedDescription)")
        }
    }
    
    func deleteAccount(){
        
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        self.currentUser = try? snapshot.data(as: User.self)
        
    }
}

