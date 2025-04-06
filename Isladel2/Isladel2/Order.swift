//
//  Order.swift
//  Isladel2
//
//  Created by Josephine Bates on 4/6/25.
//


import SwiftUI

struct Order: Identifiable {
    let id = UUID()
    let itemName: String
    let isCompleted: Bool
}

struct OrdersView: View {
    @State private var orders: [Order] = [
        Order(itemName: "Diet Coke", isCompleted: false),
        Order(itemName: "Sourdough bread", isCompleted: true),
        Order(itemName: "Rice cakes", isCompleted: false)
    ]

    var body: some View {
        List {
            Section(header: Text("Pending Orders")) {
                ForEach(orders.filter { !$0.isCompleted }) { order in
                    HStack {
                        Text(order.itemName)
                        Spacer()
                        Text("⏳")
                    }
                }
            }

            Section(header: Text("Completed Orders")) {
                ForEach(orders.filter { $0.isCompleted }) { order in
                    HStack {
                        Text(order.itemName)
                        Spacer()
                        Text("✅")
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Your Orders")
    }
}
