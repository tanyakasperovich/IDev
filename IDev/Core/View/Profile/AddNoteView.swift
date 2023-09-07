//
//  AddNoteView.swift
//  IDev
//
//  Created by Татьяна Касперович on 7.09.23.
//

import SwiftUI

struct AddNoteView: View {
    @StateObject var vm = CoreDataViewModel()
    @State var titleFieldText: String = ""
    @State var noteFieldText: String = ""
    @State var selecledColor: SelecledColor = .accent
    var color: Color
    @Binding var showAddNoteView: Bool
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Text("Add new note...")
                    .bold()
                VStack(spacing: 20) {
                    TextField("Add title here...", text: $titleFieldText)
                        .font(.headline)
                        .padding(.leading)
                        .frame(height: 55)
                        .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                        .cornerRadius(15)
                        .padding(.horizontal)
                    
                    TextField("Add note here...", text: $noteFieldText)
                        .font(.headline)
                        .padding(.leading)
                        .frame(height: 150)
                        .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                        .cornerRadius(15)
                        .padding(.horizontal)
                    
                    HStack {
                        Button {
                            selecledColor = .accent
                        } label: {
                            ZStack {
                                RoundedRectangleShape(color: Color.accentColor)
                                    .frame(width: 40, height: 40)
                                RoundedRectangleShape(color: selecledColor == .accent ? Color.white : Color.accentColor)
                                    .frame(width: 15, height: 15)
                            }
                        }
                        Button {
                            selecledColor = .swift
                        } label: {
                            ZStack {
                                RoundedRectangleShape(color: Color.theme.orangeColor)
                                    .frame(width: 40, height: 40)
                                RoundedRectangleShape(color: selecledColor == .swift ? Color.white : Color.theme.orangeColor)
                                    .frame(width: 15, height: 15)
                            }
                        }
                        Button {
                            selecledColor = .swiftUI
                        } label: {
                            ZStack {
                                RoundedRectangleShape(color: Color.theme.purpleColor)
                                    .frame(width: 40, height: 40)
                                RoundedRectangleShape(color: selecledColor == .swiftUI ? Color.white : Color.theme.purpleColor)
                                    .frame(width: 15, height: 15)
                            }
                        }
                        Button {
                            selecledColor = .uIKit
                        } label: {
                            ZStack {
                                RoundedRectangleShape(color: Color.theme.blueColor)
                                    .frame(width: 40, height: 40)
                                RoundedRectangleShape(color: selecledColor == .uIKit ? Color.white : Color.theme.blueColor)
                                    .frame(width: 15, height: 15)
                            }
                        }
                    }
                    
                    Button(action: {
                        guard !titleFieldText.isEmpty else { return }
                        //guard !noteFieldText.isEmpty else { return }
                        vm.addNote(title: titleFieldText, note: noteFieldText, color: selecledColor.rawValue)
                        vm.getNotes()
                        titleFieldText = ""
                        noteFieldText = ""
                        showAddNoteView = false
                    }, label: {
                        ZStack {
                            RoundedRectangleShape(color: Color(selecledColor.rawValue))
                                .frame(height: 55)
                            
                            Text("Save")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                        }
                    })
                    .padding(.horizontal)
                }
                .padding(.top)
            }
            .padding(.top)
        }
    }
}


struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView(color: Color.accentColor, showAddNoteView: .constant(false))
    }
}
