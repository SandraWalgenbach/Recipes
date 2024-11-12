import SwiftUI

struct UserView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        VStack {
            if authViewModel.isUserLoggedIn {
                Button(action: {
                    authViewModel.logout()
                }) {
                    Text("Abmelden")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(8)
                }
                .padding(.top)
            } else {
                Text("Du bist nicht eingeloggt.")
                    .foregroundColor(.gray)
                    .font(.body)
                    .padding()
            }
        }
        .padding()
        .navigationTitle("Benutzer")
        .navigationBarHidden(true)
    }
}

#Preview {
    UserView()
        .environmentObject(AuthenticationViewModel())
}
