import SwiftUI
import Firebase

@main
struct RecipesApp: App {
    @StateObject private var userViewModel = AuthenticationViewModel()
    
    init(){
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
                    if userViewModel.isUserLoggedIn {
                        HomeView()
                            .environmentObject(userViewModel)
                    } else {
                        AuthenticationView()
                            .environmentObject(userViewModel)
                    }
                }
    }
}
