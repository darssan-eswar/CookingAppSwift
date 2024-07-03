//
//  RegisterView.swift
//  CookingApp
//
//  Created by Matt Linder on 7/2/24.
//

import SwiftUI

struct RegisterView: View {
  @State var email = ""
  @State var username = ""
  @State var password = ""
  @Binding var page: AuthPage
  
  var body: some View {
    VStack {
      GroupBox {
        Text("Register")
          .fontWeight(.semibold)
        TextField("Email", text: $email)
          .autocorrectionDisabled()
          .textInputAutocapitalization(.never)
          .textFieldStyle(.roundedBorder)
        TextField("Username", text: $username)
          .autocorrectionDisabled()
          .textInputAutocapitalization(.never)
          .textFieldStyle(.roundedBorder)
        SecureField("Password", text: $password)
          .textFieldStyle(.roundedBorder)
        HStack {
          Button {
            User.register(
              email: email,
              username: username,
              password: password
            )
          } label: {
            Text("Register")
          }
          .buttonStyle(.borderedProminent)
          Button { page = .login } label: {
            Text("Login")
          }
          .buttonStyle(.bordered)
        }
      }
    }
    .padding(.horizontal)
  }
}
