import SwiftUI

struct AuthenticationView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text(authViewModel.isRegisterMode ? "Registrieren" : "Anmelden")
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
                if authViewModel.isRegisterMode {
                    authViewModel.register(email: email, password: password)
                } else {
                    authViewModel.login(email: email, password: password)
                }
            }) {
                Text(authViewModel.isRegisterMode ? "Registrieren" : "Anmelden")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
            
            Button(action: {
                authViewModel.isRegisterMode.toggle()
            }) {
                Text(authViewModel.isRegisterMode ? "Bereits registriert? Anmelden" : "Noch keinen Account? Registrieren")
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
        .environmentObject(AuthenticationViewModel())
}

