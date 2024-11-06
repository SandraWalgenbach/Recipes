import SwiftUI
import FirebaseAuth

class AuthenticationViewModel: ObservableObject {
    private var auth = Auth.auth()
    
    @Published var isRegisterMode: Bool = false
    @Published var user: FirebaseAuth.User? = nil
    
    init() {
        checkAuth()
    }
    
    private func checkAuth() {
        guard let currentUser = auth.currentUser else {
            print("Not logged in")
            return
        }
        self.user = currentUser
        print("User is already logged in with email: \(currentUser.email ?? "No Email")")
    }
    
    var isUserLoggedIn: Bool {
        return user != nil
    }
    
    func register(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if let error {
                print("Registration failed:", error.localizedDescription)
                return
            }
            
            guard let authResult, let email = authResult.user.email else {
                return
            }
            
            print("User with email ´\(email)´ is registered with id ´\(authResult.user.uid)´")
            self.login(email: email, password: password)
        }
    }
    
    func login(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                print("Login failed:", error.localizedDescription)
                return
            }
            
            guard let authResult = authResult, let email = authResult.user.email else {
                return
            }
            
            print("User with email ´\(email)´ is logged in with id ´\(authResult.user.uid)´")
            self?.user = authResult.user
        }
    }
    
    func logout(){
        do {
            try auth.signOut()
            self.user = nil
            print("User wurde abgemeldet!")
        } catch {
            print("Error signing out:", error.localizedDescription)
        }
    }
}

