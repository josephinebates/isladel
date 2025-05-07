import SwiftUI
import CoreLocation

struct NearbyRequestsView: View {
    @State private var allRequests: [NearbyRequestModel] = [
        NearbyRequestModel(title: "Milk", location: "Lopez Village", distance: 0.4),
        NearbyRequestModel(title: "Coffee Filters", location: "Islandale", distance: 1.2),
        NearbyRequestModel(title: "Cereal", location: "Odlin Park", distance: 3.5),
        NearbyRequestModel(title: "Toilet Paper", location: "Shark Reef", distance: 6.7)
    ]

    @State private var searchText: String = ""

    var filteredRequests: [NearbyRequestModel] {
        if searchText.isEmpty {
            return allRequests
        } else {
            return allRequests.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.location.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(filteredRequests.sorted(by: { $0.distance < $1.distance })) { request in
                    VStack(alignment: .leading) {
                        Text(request.title)
                            .font(.headline)
                        Text("\(request.location) — \(String(format: "%.1f", request.distance)) mi")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 4)
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic))
            .navigationTitle("Nearby Requests")
        }
    }
}

struct NearbyRequestModel: Identifiable {
    let id = UUID()
    let title: String
    let location: String
    let distance: Double // in miles
}

