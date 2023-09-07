//
//  TabBarView.swift
//  IDev
//
//  Created by Татьяна Касперович on 14.08.23.
//

import SwiftUI

struct TabBarView: View {
   // @Binding var showSignInView: Bool
    
    @State var selectedView: TabBar = .home
    
    var body: some View {
        TabView {
            NavigationStack {
               HomeView()
            }
            .tabItem {
                Image(systemName: "swift")
                Text(TabBar.home.rawValue)
            }
            .tag(TabBar.home)
            
            NavigationStack {
               LevelsMapView()
            }
            .tabItem {
                Image(systemName: "map.fill")
                Text(TabBar.roadMap.rawValue)
            }
            .tag(TabBar.roadMap)
            


            NavigationStack {
                CalendarView()
            }
            .tabItem {
                Image(systemName: "calendar")
                Text(TabBar.calendar.rawValue)
            }
            .tag(TabBar.calendar)

            
            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Image(systemName: "person")
                Text(TabBar.profile.rawValue)
            }
            .tag(TabBar.profile)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

enum TabBar: String {
    case home = "Home"
    case roadMap = "Road Map"
    case calendar = "Calendar"
    case profile = "Profile"
}
