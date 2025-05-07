import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FulfillRequestListView()
                .tabItem {
                    Label("Inbox", systemImage: "tray.full")
                }

            MyRequestListView()
                .tabItem {
                    Label("My Orders", systemImage: "cart")
                }

            NearbyRequestsView()
                .tabItem {
                    Label("Nearby", systemImage: "location.fill")
                }

            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle")
                }
        }
    }
}

