//
//  CreateRequestView.swift
//  Isladel2
//
//  Created by Josephine Bates on 4/6/25.
//


import SwiftUI

struct CreateRequestView: View {
    @State private var itemName: String = ""
    @State private var notes: String = ""
    @State private var isUrgent: Bool = false
    @State private var submitted: Bool = false

    var body: some View {
        Form {
            Section(header: Text("Item Details")) {
                TextField("What do you need?", text: $itemName)
                TextField("Any extra notes?", text: $notes)
            }

            Section {
                Toggle("Urgent?", isOn: $isUrgent)
            }

            Section {
                Button(action: {
                    submitRequest()
                }) {
                    Text("Submit Request")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }

            if submitted {
                Text("✅ Request submitted!")
                    .foregroundColor(.green)
            }
        }
        .navigationTitle("New Request")
    }

    func submitRequest() {
        // 🔜 In the future, connect to Firestore here
        submitted = true
        print("Request submitted: \(itemName), urgent: \(isUrgent), notes: \(notes)")
    }
}
