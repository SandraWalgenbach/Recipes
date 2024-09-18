import SwiftUI

struct AuthenticationView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var userViewModel: AuthenticationViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text(userViewModel.isRegisterMode ? "Registrieren" : "Anmelden")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 40)
            
            TextField("E-Mail-Adresse", text: $email)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                .padding(.horizontal)
            
            SecureField("Passwort", text: $password)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                .padding(.horizontal)
            
            Button(action: {
                if userViewModel.isRegisterMode {
                    userViewModel.register(email: email, password: password)
                } else {
                    userViewModel.login(email: email, password: password)
                }
            }) {
                Text(userViewModel.isRegisterMode ? "Registrieren" : "Anmelden")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
            
            Button(action: {
                userViewModel.isRegisterMode.toggle()
            }) {
                Text(userViewModel.isRegisterMode ? "Bereits registriert? Anmelden" : "Noch keinen Account? Registrieren")
                    .foregroundColor(.blue)
                    .font(.footnote)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    AuthenticationView()
}

