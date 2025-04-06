//
//  ContentView 2.swift
//  Isladel2
//
//  Created by Josephine Bates on 4/6/25.
//


import SwiftUI
// import FirebaseAuth

struct ContentView: View {
    @StateObject private var authManager = AuthManager.shared

    var body: some View {
        Group {
            if authManager.user != nil {
                HomeView()
            } else {
                VStack(spacing: 20) {
                    Text("Welcome to Isladel")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top)

                    Button(action: {
                        authManager.signInWithApple()
                    }) {
                        HStack {
                            Image(systemName: "applelogo")
                            Text("Sign in with Apple")
                                .font(.headline)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding()
                }
                .padding()
            }
        }
        .onAppear {
            authManager.checkUserStatus()
        }
    }
}
