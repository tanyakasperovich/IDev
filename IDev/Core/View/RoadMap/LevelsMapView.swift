//
//  LevelsMapView.swift
//  IDev
//
//  Created by Татьяна Касперович on 17.09.23.
//

import SwiftUI

struct LevelsMapView: View {
    @State var isSelectedLevel = false
    @State var selectedCategory: CategoriesBlock_2 = .noCategory
    @State var color: Color = Color.accentColor
    @StateObject var vm = RoadMapViewModel()
    


    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                // Levels...
                ForEach(vm.levels, id: \.self) { level in
                    
                    LevelView(level: level, isSelectedLevel: $isSelectedLevel, color: $color)
                    
                }
            }
            .padding(.horizontal, 10)
            .background(BackgroundView(color: isSelectedLevel ? color : .accentColor))
            .navigationTitle("Road Map")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
 
}


struct LevelsMapView_Previews: PreviewProvider {
    static var previews: some View {
        LevelsMapView()
    }
}

struct ProgressView: View {
   
    var body: some View {
        HStack {
            Text("Progress: ")
                .bold()
                .foregroundColor(.black).opacity(0.6)
            Text("25 %")
                .font(.body)
                .bold()
                .padding(.horizontal, 5)
                .foregroundColor(.black).opacity(0.6)
            // ProgressLine...
            ZStack {
                RoundedRectangleShape(color: .white)
                RoundedRectangleShape(color: .yellow).opacity(0.8).padding(.trailing, 90)
            }
            .padding([.top, .bottom, .leading])
        }
        .padding(.horizontal)
    }
}

struct TitleLevelView: View {
    var level: Level
    @Binding var isSelectedLevel: Bool
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangleShape(color: .white)
                    .opacity(0.9)
                VStack {
                    Text(level.title)
                        .font(.headline)
                        .bold()
                        .opacity(0.9)
                        .padding(.bottom, 5)
                    
                    Text("level.subTitle")
                        .opacity(0.7)
                }
                .foregroundColor(.black)
                .padding(.vertical)
            }
            
            VStack {
                Button {
                    isSelectedLevel.toggle()
                    //vm.selectedCategory = .noCategory
                    //color = vm.selectedColor
                    //selectedCategory = .noCategory
                } label: {
                    ZStack {
                        RoundedRectangleShape(color: .white)
                            .opacity(0.9)
                            .frame(width: 55, height: 55)
                        
                        Image(systemName: isSelectedLevel ? "chevron.up" : "chevron.down")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.accentColor)
                    }
                }
            }
        }
        .padding(.bottom)
    }
}

struct LevelView: View {
    var level: Level
    
    @Binding var isSelectedLevel: Bool
    @Binding var color: Color
    @State var selectedCategory: CategoriesBlock_2 = .noCategory
    @StateObject var vm = RoadMapViewModel()
    
    var body: some View {
        ZStack{
            
            RoundedRectangleShape(color: .accentColor)
            
            VStack {
                // Progress...
                ProgressView()
                
                // Level...
                TitleLevelView(level: level, isSelectedLevel: $isSelectedLevel)
                
                // Category...
                if isSelectedLevel {
                    ZStack {
                        RoundedRectangleShape(color: .accentColor)
                            .opacity(0.9)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(level.categories, id: \.self) { category in
                                    CategoryCardView(selectedCategory: category.category, color: category.color)
                                }
                            }
                            .padding()
                        }
                    }
                    
                    // RoadMap...
                    if selectedCategory != .noCategory {
                        VStack {
                            ForEach(level.categories, id: \.self) { roadMap in
                                
                                if selectedCategory == roadMap.category {
                                    RoadMapView(roadMap: roadMap)
                                }
                            }
                        }
                    }
                }
            }
            .foregroundColor(.white)
            .padding()
        }
        .padding(.vertical, 5)
    }
    @ViewBuilder
    func CategoryCardView(selectedCategory: CategoriesBlock_2, color: Color)->some View{
        
        Button {
            // Updating Category...
           // withAnimation{
                vm.selectedCategory = selectedCategory
                self.color = color
                self.selectedCategory = selectedCategory
            //}
        } label: {
            ZStack {
                RoundedRectangleShape(color: .white)
                        .opacity(0.7)
                        .frame(height: 55)
                RoundedRectangleShape(color: color)
                    .opacity(vm.selectedCategory == selectedCategory ? 1 : 0.2)
                    .frame(height: 55)
                
                Text(selectedCategory.rawValue)
                    .bold()
                    .padding()
                    .foregroundColor(vm.selectedCategory == selectedCategory ? .white : color)
                    .opacity(vm.selectedCategory == selectedCategory ? 1 : 0.9)
            }
        }
        
    }
}
