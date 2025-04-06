//
//  AccountView.swift
//  Isladel2
//
//  Created by Josephine Bates on 4/6/25.
//


import SwiftUI
// import FirebaseAuth

struct AccountView: View {
    @StateObject private var authManager = AuthManager.shared

    var body: some View {
        Form {
            Section(header: Text("User Info")) {
                HStack {
                    Text("Email:")
                    Spacer()
                    Text(authManager.user?.email ?? "Unknown")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.trailing)
                }

                HStack {
                    Text("User ID:")
                    Spacer()
                    Text(authManager.user?.uid ?? "Unknown")
                        .foregroundColor(.gray)
                        .font(.caption2)
                        .multilineTextAlignment(.trailing)
                }
            }

            Section {
                Button(action: {
                    authManager.signOut()
                }) {
                    Text("Sign Out")
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .navigationTitle("Account")
    }
}
