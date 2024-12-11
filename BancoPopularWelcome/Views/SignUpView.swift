//
//  SignUpView.swift
//  BancoPopularWelcome
//
//  Created by Merianni Nunez Tejeda on 12/10/24.
//

import SwiftUI

struct SignUpView: View {
    let themeColor = Color(red: 27/255, green: 97/255, blue: 161/255)
    @StateObject private var userManager = UserManager()
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var errorMessage: String?
    @State private var isSignedUp = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(themeColor)
                .padding(.bottom, 10)
            Text("Personal Information")
                .font(.headline)
            Text("Confirm your personal information")
                .font(.subheadline)
                .fontWeight(.light)
            
            TextField("Full Name", text: $fullName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
            Button(action: {
                errorMessage = userManager.signUpUser(fullName: fullName, email: email, password: password, confirmPassword: confirmPassword)
                if errorMessage == nil {
                    isSignedUp = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        isSignedUp = false
                        presentationMode.wrappedValue.dismiss()
                    }
                    fullName = ""
                    email = ""
                    password = ""
                    confirmPassword = ""
                }
                print(userManager.getUsers())
            }){
                if isSignedUp {
                    Image(systemName: "checkmark")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(themeColor)
                        .cornerRadius(12)
                        .padding(.horizontal, 1)
                        .shadow(color: Color.black.opacity(0.2), radius: 8, x:0, y:4)
                    
                } else {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(themeColor.opacity(fullName.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty ? 0.5 : 1.0))
                        .cornerRadius(12)
                        .padding(.horizontal, 1)
                        .shadow(color: Color.black.opacity(0.2), radius: 8, x:0, y:4)
                }
            }
            .disabled(fullName.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty)
            .padding(.bottom, 32)
        }
        .padding()
    }
}




#Preview {
    SignUpView()
}
