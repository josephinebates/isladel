import SwiftUI

struct MyRequestListView: View {
    @State private var myRequests: [MyRequestModel] = [
        MyRequestModel(title: "Bread and Butter", isCompleted: false, location: "Lopez Village Market"),
        MyRequestModel(title: "Dog food", isCompleted: true, location: "Islandale"),
        MyRequestModel(title: "Ice Cream Emergency", isCompleted: false, location: "Ferry Dock")
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(myRequests) { request in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(request.title)
                                .font(.headline)
                            Text(request.location)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        if request.isCompleted {
                            Text("✅")
                        } else {
                            Text("⏳")
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("My Orders")
        }
    }
}

struct MyRequestModel: Identifiable {
    let id = UUID()
    let title: String
    let isCompleted: Bool
    let location: String
}

