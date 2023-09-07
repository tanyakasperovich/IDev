//
//  HomeView.swift
//  IDev
//
//  Created by Татьяна Касперович on 18.09.23.
//

import SwiftUI

struct HomeView: View {
    @State private var showDayTaskProgressView: Bool = false
    @State private var showMonthTaskProgressView: Bool = false
    @State private var showGeneralProgressView: Bool = false
    
    @State private var showTopYouTubeChanelView: Bool = false
    @State private var showTop10BooksView: Bool = false
    @State private var showTop5CoursesView: Bool = false
    
    @State var isFavoriteTip = false
    
    var body: some View {
        NavigationStack {
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    
                    // PROGRESS....
                    VStack(alignment: .leading) {
                        Text("PROGRESS")
                            .bold()
                            .padding(.horizontal)
                            .padding(.bottom, 5)
                            .foregroundColor(.black)
                            .opacity(0.7)
                        
                    HStack(alignment: .top) {
                        // Цель дня, Цель 30 дней...
                        VStack(alignment: .leading) {
                            // Цель дня....
                            Text("Цель дня")
                                .font(.body)
                                .bold()
                                .padding(.horizontal)
                                .foregroundColor(.black)
                                //.opacity(0.7)
                            
                            Button {
                                showDayTaskProgressView = true
                            } label: {
                            ZStack {
                                RoundedRectangleShape(color: .accentColor)
                                
                                ZStack {
                                    RoundedRectangleShape(color: .white)
                                        .opacity(0.9)
                                    
                                    HStack {
                                        ZStack {
                                            Circle()
                                                .frame(height: 25)
                                            Circle()
                                                .frame(height: 15)
                                                .foregroundColor(.white)
                                                .opacity(0.7)
                                        }
                                        
                                        Text("50 %")
                                            .font(.body)
                                            .bold()
                                            .padding(.horizontal, 5)
                                    }
                                    .padding()
                                }
                                .padding(25)
                            }
                            .padding(.bottom, 10)
                        }
                            
                            // Цель 30 дней....
                            Text("Цель 30 дней")
                                .font(.body)
                                .bold()
                                .padding(.horizontal)
                                .foregroundColor(.black)
                               // .opacity(0.7)
                            
                            Button {
                               showMonthTaskProgressView = true
                            } label: {
                                ZStack {
                                    RoundedRectangleShape(color: .accentColor)
                                    
                                    ZStack {
                                        RoundedRectangleShape(color: .white)
                                            .opacity(0.9)
                                        
                                        HStack {
                                            ZStack {
                                                Circle()
                                                    .frame(height: 25)
                                                Circle()
                                                    .frame(height: 15)
                                                    .foregroundColor(.white)
                                                    .opacity(0.7)
                                            }
                                            
                                            Text("25 %")
                                                .font(.body)
                                                .bold()
                                                .padding(.horizontal, 5)
                                        }
                                        .padding()
                                    }
                                    .padding(25)
                                }
                            }
                        }
                        
                        //Общий прогресс...
                        VStack {
                            Text("Общий прогресс")
                                .font(.body)
                                .bold()
                                .padding(.horizontal)
                                .foregroundColor(.black)
                               // .opacity(0.7)
                            
                            Button {
                                showGeneralProgressView = true
                            } label: {
                                ZStack {
                                    RoundedRectangleShape(color: .accentColor)
                                    
                                    ZStack {
                                        RoundedRectangleShape(color: .white)
                                            .opacity(0.9)
                                        
                                        VStack(alignment: .leading) {
                                            ForEach(["Блок 1", "Блок 2", "Блок 3"], id: \.self) {item in
                                                Text(item)
                                                
                                                HStack {
                                                    ZStack {
                                                        Circle()
                                                            .frame(height: 25)
                                                        Circle()
                                                            .frame(height: 15)
                                                            .foregroundColor(.white)
                                                            .opacity(0.7)
                                                    }
                                                    
                                                    Text("50 %")
                                                        .padding(.horizontal, 5)
                                                }
                                            }
                                        }
                                        .bold()
                                        .padding()
                                    }
                                    .padding(30)
                                }
                            }
                        }
                    }
                }
                    .padding(.bottom, 25)
                    .padding(.top, 10)
                    
                    
                   Divider()
                    
                    // TOP....
                    VStack(alignment: .leading) {
                        Text("TOPS")
                            .bold()
                            .padding(.horizontal)
                            .padding(.bottom, 5)
                            .foregroundColor(.black)
                            .opacity(0.7)
                        
                    HStack {
                        // YouTube...
                        VStack {
                            Button {
                               showTopYouTubeChanelView = true
                            } label: {
                                ZStack {
                                    RoundedRectangleShape(color: .accentColor)
                                    
                                    ZStack {
                                        RoundedRectangleShape(color: .white)
                                            .opacity(0.9)
                                        
                                        Text("Топ 10 YouTube каналов для обучения")
                                            .font(.body)
                                            .bold()
                                            .padding()
                                    }
                                    .padding(30)
                                }
                            }
                        }
                        
                        // Books...
                        VStack {
                            // Books...
                            Button {
                               showTop10BooksView = true
                            } label: {
                                ZStack {
                                    RoundedRectangleShape(color: .accentColor)
                                    
                                    ZStack {
                                        RoundedRectangleShape(color: .white)
                                            .opacity(0.9)
                                        Text("Топ 10 книг")
                                            .font(.body)
                                            .bold()
                                            .padding()
                                    }
                                    .padding(25)
                                }
                            }
                            
                            // Courses...
                            Button {
                               showTop5CoursesView = true
                            } label: {
                                ZStack {
                                    RoundedRectangleShape(color: .accentColor)
                                    
                                    ZStack {
                                        RoundedRectangleShape(color: .white)
                                            .opacity(0.9)
                                        
                                        Text("Топ 5 курсов")
                                            .font(.body)
                                            .bold()
                                            .padding()
                                    }
                                    .padding(25)
                                }
                            }
                            
                            
                        }
                    }
                    .frame(height: 260)
                }
                    .padding(.bottom, 25)
//                    .padding(.top, 25)
                    
                  //  Divider()
                    
                    // TIP OF THE DAY....
                    VStack(alignment: .leading) {
                        Text("TIP OF THE DAY")
                            .bold()
                            .padding(.horizontal)
                            .padding(.bottom, 5)
                            .foregroundColor(.black)
                            .opacity(0.7)
                        
                        VStack {
                            ZStack {
                                RoundedRectangleShape(color: .accentColor)
                                
                                ZStack {
                                    RoundedRectangleShape(color: .white)
                                        .opacity(0.9)
                                    
                                    VStack {
                                        HStack {
                                            Spacer()
                                            
                                            Button {
                                                isFavoriteTip.toggle()
                                            } label: {
                                                Image(systemName: isFavoriteTip ? "heart.fill" : "heart")
                                                    .foregroundColor(.pink)
                                                
                                            }
                                          
                                        }
                                        
                                        Circle()
                                            .opacity(0.4)
                                        
                                        
                                        Text("Совет дня")
                                            .font(.body)
                                            .bold()
                                            .padding()
                                        
                                        Text("bjbjbjbj")
                                            .font(.body)
                                        
                                        
                                        Spacer()
                                    }
                                    .padding()
                                    
                                }
                                .padding(30)
                            }
                            
                        }
                        .frame(height: 260)
                    }
                    .padding(.bottom, 25)
                   // .padding(.top, 25)
                }
                .padding(.horizontal, 10)
                .foregroundColor(.accentColor)
            }
            .background(BackgroundView(color: .accentColor))
            .sheet(isPresented: $showDayTaskProgressView, content: {
                ProgressDayTaskView()
           })
            .sheet(isPresented: $showMonthTaskProgressView, content: {
                ProgressMonthTaskView()
           })
            .sheet(isPresented: $showGeneralProgressView, content: {
               GeneralProgressView()
           })
            .sheet(isPresented: $showTopYouTubeChanelView, content: {
                TopYouTubeChanelView()
           })
            .sheet(isPresented: $showTop10BooksView, content: {
                Top10BooksView()
           })
            .sheet(isPresented: $showTop5CoursesView, content: {
                Top5CoursesView()
           })
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct ProgressDayTaskView: View {
    
    var body: some View {
        Text("Day Task View")
    }
}

struct ProgressMonthTaskView: View {
    
    var body: some View {
        Text("Month Task View")
    }
}

struct GeneralProgressView: View {
    
    var body: some View {
        Text("General Progress View")
    }
}

// TopYouTubeChanelView.......
struct TopYouTubeChanelView: View {
    
    var body: some View {
        Text("Top YouTube Chanel View")
    }
}

// Top10BooksView.......
struct Top10BooksView: View {
    
    var body: some View {
        Text("Top 10 Books View")
    }
}

// Top5CoursesView.......
struct Top5CoursesView: View {
    
    var body: some View {
        Text("Top 5 Courses View")
    }
}
