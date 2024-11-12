import SwiftUI

struct AuthenticationView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        
        
        VStack(spacing: 20) {
            
            Text(authViewModel.isRegisterMode ? "Registrieren" : "Anmelden")
                .foregroundColor(.black)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 40)
            
            TextField("E-Mail-Adresse", text: $email)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .padding()
                .background(.white)
                .cornerRadius(8)
                .padding(.horizontal)
            
            SecureField("Passwort", text: $password)
                .padding()
                .background(.white)
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
                    .padding()
                    .background(.green)
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
            
            Button(action: {
                authViewModel.isRegisterMode.toggle()
            }) {
                Text(authViewModel.isRegisterMode ? "Bereits registriert? Anmelden" : "Noch keinen Account? Hier Registrieren")
                    .foregroundColor(.black)
                    .font(.footnote)
                    .bold()
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

