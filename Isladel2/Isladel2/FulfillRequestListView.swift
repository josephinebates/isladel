import SwiftUI

struct FulfillRequestListView: View {
    @State private var requests: [FulfillmentRequestModel] = [
        FulfillmentRequestModel(title: "2 gallons of milk", location: "Islandale"),
        FulfillmentRequestModel(title: "Prescription pickup", location: "Pharmacy"),
        FulfillmentRequestModel(title: "Dog food", location: "Lopez Village Market")
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(requests) { request in
                    HStack {
                        Image(systemName: "tray")
                            .foregroundColor(.blue)
                        VStack(alignment: .leading) {
                            Text(request.title)
                                .font(.headline)
                            Text(request.location)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Fulfillment Inbox")
        }
    }
}

struct FulfillmentRequestModel: Identifiable {
    let id = UUID()
    let title: String
    let location: String
}

