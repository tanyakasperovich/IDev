//
//  ProfileView.swift
//  IDev
//
//  Created by Татьяна Касперович on 14.08.23.
//

import SwiftUI

struct ProfileView: View {
    @State private var showAddNoteView: Bool = false

    @StateObject var vm = CoreDataViewModel()
    
    var body: some View {
        ZStack {
            RoundedRectangleShape(color: .accentColor)

                Button{
                    showAddNoteView = true
                } label: {
                    HStack {
                        Text("Add new note")
                            .bold()
                        Spacer()
                        Image(systemName: "square.and.pencil")
                    }
                    
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding()
                }
            }
            .padding()
            .frame(height: 55)
            
            List {
                ForEach(vm.notes) { entity in
                    VStack {
                        Text(entity.name ?? "NO NAME")
                            .bold()
                            .foregroundColor(Color(entity.color ?? "AccentColor"))
                    }
                    .onTapGesture {
                            vm.updateNote(entity: entity)
                        }
                    
                }
                .onDelete(perform: vm.deleteNote)
            }
            .listStyle(PlainListStyle())
            .background(BackgroundView(color: .accentColor))
         .sheet(isPresented: $showAddNoteView, content: {
            AddNoteView(color: Color.accentColor, showAddNoteView: $showAddNoteView)
        .onAppear(){
                     vm.getNotes()
                 }
        })
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfileView()
        }
    }
}

