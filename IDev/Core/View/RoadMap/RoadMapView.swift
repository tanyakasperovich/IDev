//
//  RoadMapView.swift
//  IDev
//
//  Created by Татьяна Касперович on 14.08.23.
//

import SwiftUI

struct RoadMapView: View {
    var roadMap: Category
    
    var body: some View {
        VStack {
            Text(roadMap.subTitle)
                .bold()
                .foregroundColor(.white)
        
            
            ZStack {
                RoundedRectangleShape(color: .accentColor)
                   
                
            // Staggered Grid...
            StaggeredGrid(columns: 3, spacing: 15, list: roadMap.roadMap) {item in
                // Card View...
                NavigationLink{
                    SubView(color: roadMap.color, roadMap: item)
                } label: {
                    ZStack {
                        RoundedRectangleShape(color: .white)
                           // .opacity(0.7)
                        
                        RoundedRectangleShape(color: roadMap.color)
                            .opacity(item.rating > 0 ? 1 : 0.2)
                        
                        VStack {
                            HStack {
                                if item.rating > 0 {
                                    Spacer()
                                    Image(systemName: item.rating == 100 ? "circle.hexagonpath.fill" : "circle.hexagonpath")
                                        .foregroundColor(.yellow)
                                        .opacity(item.rating == 100 ? 1 : 0.7)
                                }
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            
                            Text(item.title)
                                .foregroundColor(item.rating > 0  ? .white : .secondary)
                                .padding(.horizontal)
                                .padding(.bottom)
                                .opacity(item.rating > 0 ? 1 : 0.7)
                        }
                    }
                }
            }
            .padding()
        }
        }
    
    }
}

struct RoadMapView_Previews: PreviewProvider {
    static var previews: some View {
        RoadMapView(roadMap: Category(title: "UIKit", subTitle: "UIKit Road Map", description: "", color: .theme.blueColor, category: .uIKit, roadMap: [
            RoadMap(id: 0, title: "The Basics", descriptio: "Work with common kinds of data and write basic syntax.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics", rating: 10),
            RoadMap(id: 1, title: "Basic Operators", descriptio: "Perform operations like assignment, arithmetic, and comparison.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators", rating: 100),
            RoadMap(id: 2, title: "Strings and Characters", descriptio: "Store and manipulate text.", url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters", rating: 0)
     
        ]) )
        .background(Color.accentColor)
    }
}
