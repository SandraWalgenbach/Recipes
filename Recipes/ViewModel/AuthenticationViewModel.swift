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
            print("nicht angemeldet")
            return
        }
        self.user = currentUser
        print("User ist angemeldet mit email: \(currentUser.email ?? "keine Email")")
    }
    
    var isUserLoggedIn: Bool {
        return user != nil
    }
    
    func register(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if let error {
                print("Registrierung fehlgeschlagen:", error.localizedDescription)
                return
            }
            
            guard let authResult, let email = authResult.user.email else {
                return
            }
            
            print("User mit email ´\(email)´ ist regestriert mit id ´\(authResult.user.uid)´")
            self.login(email: email, password: password)
        }
    }
    
    func login(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                print("Login fehlgeschlagen:", error.localizedDescription)
                return
            }
            
            guard let authResult = authResult, let email = authResult.user.email else {
                return
            }
            
            print("User mit email ´\(email)´ ist ein gelogged mit id ´\(authResult.user.uid)´")
            self?.user = authResult.user
        }
    }
    
    func logout(){
        do {
            try auth.signOut()
            self.user = nil
            print("User wurde abgemeldet!")
        } catch {
            print("fehler beim abmelden:", error.localizedDescription)
        }
    }
}

