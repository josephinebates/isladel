//
//  DashboardView.swift
//  Isladel2
//
//  Created by Josephine Bates on 5/7/25.
//


import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            HStack(spacing: 16) {
                NavigationLink(destination: CreateRequestView()) {
                    VStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        Text("Create Order")
                            .font(.headline)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(12)
                }

                NavigationLink(destination: FulfillRequestListView()) {
                    VStack {
                        Image(systemName: "tray.full.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        Text("Fulfill Request")
                            .font(.headline)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .padding()
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(12)
                }
            }
            .padding()
            .navigationTitle("Isladel Dashboard")
        }
    }
}
