//
//  LoginView.swift
//  component
//
//  Created by Songwut Maneefun on 24/1/23.
//



import SwiftUI

struct LoginScreen: View {
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.green, .green]), startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack(alignment: .center, spacing: 24) {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                VStack(alignment: .leading) {
                    Text("Username")
                        .font(.headline)
                        .foregroundColor(.white)
                    TextField("Enter username", text: $username)
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 16).stroke(Color.white, lineWidth: 1))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 24)
                
                VStack(alignment: .leading) {
                    Text("Password")
                        .font(.headline)
                        .foregroundColor(.white)
                    SecureField("Enter password", text: $password)
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 16).stroke(Color.white, lineWidth: 1))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 24)
                
                HStack(spacing: 24) {
                    Button(action: {
                        // Perform login action
                    }) {
                        Text("Login")
                            .foregroundColor(.white)
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 16).fill(Color.white))
                            .shadow(radius: 5)
                    }
                    
                    Button(action: {
                        // Perform register action
                    }) {
                        Text("Register")
                            .foregroundColor(.white)
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 16).fill(Color.white))
                            .shadow(radius: 5)
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 100)
        }
        .edgesIgnoringSafeArea(.all)
    }
}




struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
