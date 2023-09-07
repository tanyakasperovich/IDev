//
//  SubView.swift
//  IDev
//
//  Created by Татьяна Касперович on 16.08.23.
//

import SwiftUI

struct SubView: View {
    var color: Color
    var roadMap: RoadMap
    
    @State var isPremiumUser = false
    
    @State private var showAddNoteView: Bool = false
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
            ZStack {
                RoundedRectangleShape(color: .accentColor)
                
                ZStack {
                    RoundedRectangleShape(color: .white)
                        .opacity(0.9)
                    
                    VStack {
                        HStack() {
                            
                            Spacer()
                            Text(roadMap.title)
                            
                            Spacer()
                            
                            Button{
                                
                            } label: {
                                Image(systemName: "heart")
                                    .foregroundColor(.pink)
                            }
                            
                            
                        }
                        .font(.title2)
                        .bold()
                        .foregroundColor(color)
                        .padding(.vertical)
                        
                        Text(roadMap.descriptio)
                            .font(.title2)
                            .foregroundColor(.secondary)
                        
                        
                        HStack {
                            NavigationLink {
                                DetailWebView(url: roadMap.url)
                            } label: {
                                Image(systemName: "doc.text")
                                    .padding()
                            }
                            
                            
                            Button{
                                showAddNoteView = true
                            } label: {
                                Image(systemName: "square.and.pencil")
                                    .padding()
                            }
                            
                            
                            if isPremiumUser {
                                NavigationLink {
                                    //
                                    Text("Books...")
                                } label: {
                                    Image(systemName: "book.fill")
                                        .padding()
                                }
                            } else {
                                NavigationLink {
                                    // buy premium...
                                    Text("Buy Premium...")
                                } label: {
                                    ZStack {
                                        
                                        Image(systemName: "book.fill")
                                            .padding()
                                            .foregroundColor(.secondary)
                                            .opacity(0.5)
                                        
                                        VStack {
                                            Image(systemName: "lock.circle")
                                                .font(.title)
                                                .foregroundColor(.accentColor)
                                        }
                                        .padding(.leading, 30)
                                        .padding(.bottom, 30)
                                        
                                    }
                                }
                            }
                            
                            
                            if isPremiumUser {
                                NavigationLink {
                                    //
                                    Text("Video...")
                                } label: {
                                    Image(systemName: "video.fill")
                                        .padding()
                                }
                            } else {
                                NavigationLink {
                                    // buy premium...
                                    Text("Buy Premium...")
                                } label: {
                                    ZStack {
                                        
                                        Image(systemName: "video.fill")
                                            .padding()
                                            .foregroundColor(.secondary)
                                            .opacity(0.5)
                                        
                                        VStack {
                                            Image(systemName: "lock.circle")
                                                .font(.title)
                                                .foregroundColor(.accentColor)
                                        }
                                        .padding(.leading, 30)
                                        .padding(.bottom, 30)
                                        
                                    }
                                }
                            }
                            
                        }
                        .foregroundColor(color)
                        .font(.title2)
                        .padding(.vertical)
                    }
                    .padding()
                }
                .padding(30)
            }
//             .padding()
            
            VStack {
                //                VStack {
                //                        NavigationLink {
                //                            DetailWebView(url: roadMap.url)
                //                        } label: {
                //                            ZStack{
                //                               RoundedRectangleShape(color: color)
                //
                //                                HStack {
                //                                    Image(systemName: "doc.text")
                //                                    Text(roadMap.title)
                //                                }
                //                                .font(.headline)
                //                                .foregroundColor(.white)
                //                                .padding(.vertical)
                //                            }
                //
                //                    }
                //                }
                //                .frame(height: 55)
                
                // red, yellow, green...
                VStack {
                    
                    if isPremiumUser {
                        NavigationLink {
                            //
                            Text("\(roadMap.rating) %")
                        } label: {
                            Text("\(roadMap.rating) %")
                                .font(.body)
                                .bold()
                                .foregroundColor(color)
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal)
                                .border(color)
                        }
                    } else {
                        NavigationLink {
                            // buy premium...
                            Text("Buy Premium...")
                        } label: {
                            ZStack {
                                
                                Text("\(roadMap.rating) %")
                                    .font(.body)
                                    .bold()
                                    .foregroundColor(.secondary)
                                    .padding(.vertical)
                                    .frame(maxWidth: .infinity)
                                    .padding(.horizontal)
                                    .border(.gray)
                                    .opacity(0.5)
                                
                                HStack {
                                    Spacer()
                                    
                                    Image(systemName: "lock.circle")
                                        .font(.title)
                                        .padding()
                                        .foregroundColor(.accentColor)
                                }
                            }
                        }
                    }
                    
                    
                    
                }
                
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            HStack {
                Text("Progress: 0%").foregroundColor(color)
                    .padding()
                Spacer()
            }
            
        }
        .padding(.horizontal, 10)
    }
        .sheet(isPresented: $showAddNoteView, content: {
           AddNoteView(color: Color.accentColor, showAddNoteView: $showAddNoteView)
       })
        
    }
}

struct SubView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SubView(color: Color.indigo, roadMap: RoadMapViewModel().swiftRoadMap[0])
            .background(BackgroundView(color: .theme.purpleColor))
        }
    }
}
