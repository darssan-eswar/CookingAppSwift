//
//  LoginView.swift
//  CookingApp
//
//  Created by Matt Linder on 7/2/24.
//

import SwiftUI

struct LoginView: View {
  @State var email = ""
  @State var password = ""
  @Binding var page: AuthPage
  
  var body: some View {
    VStack {
      GroupBox {
        Text("Login")
          .fontWeight(.semibold)
        TextField("Email", text: $email)
          .textFieldStyle(.roundedBorder)
          .autocorrectionDisabled()
          .textInputAutocapitalization(.never)
        SecureField("Password", text: $password)
          .textFieldStyle(.roundedBorder)
        HStack {
          Button { User.login(email: email, password: password) } label: {
            Text("Login")
          }
          .buttonStyle(.borderedProminent)
          Button { page = .register } label: {
            Text("Register")
          }
          .buttonStyle(.bordered)
        }
      }
    }
    .padding(.horizontal)
  }
}
