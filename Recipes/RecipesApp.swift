import SwiftUI
import Firebase

@main
struct RecipesApp: App {
    @StateObject private var authViewModel = AuthenticationViewModel()
    
    init(){
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
                    if authViewModel.isUserLoggedIn {
                        HomeView()
                            .environmentObject(authViewModel)
                    } else {
                        AuthenticationView()
                            .environmentObject(authViewModel)
                    }
                }
    }
}
