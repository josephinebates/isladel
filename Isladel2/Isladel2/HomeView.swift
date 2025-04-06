//
//  HomeView.swift
//  Isladel2
//
//  Created by Josephine Bates on 4/6/25.
//

import SwiftUI
// import FirebaseAuth

struct HomeView: View {
    @StateObject private var authManager = AuthManager.shared

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("📦 Isladel Dashboard")
                    .font(.largeTitle)
                    .bold()

                Text("Welcome, \(authManager.user?.email ?? "friend")!")
                    .foregroundColor(.gray)
                    .font(.subheadline)

                NavigationLink(destination: CreateRequestView()) {
                    Text("➕ Create New Request")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                NavigationLink(destination: OrdersView()) {
                    Text("📋 View Orders")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                NavigationLink(destination: AccountView()) {
                    Text("👤 Account")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Home")
        }
    }
}
