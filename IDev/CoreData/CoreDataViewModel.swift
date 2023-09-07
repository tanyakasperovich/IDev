//
//  CoreDataViewModel.swift
//  IDev
//
//  Created by Татьяна Касперович on 6.09.23.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    let manager = CoreDataManager.instance
    
    @Published var notes: [NoteEntity] = []
    
    init() {
        getNotes()
    }
    
    func getNotes() {
        let request = NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
        
        do {
            notes = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func addNote(title: String, note: String, color: SelecledColor.RawValue) {
   
        let newNote = NoteEntity(context: manager.context)
        newNote.name = title
        newNote.note = note
        newNote.color = color
        save()
    }

    
    func updateNote(entity: NoteEntity) {
        let currentName = entity.name ?? ""
        let newName = currentName + "!"
        entity.name = newName
        save()
    }

    func deleteNote(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = notes[index]
        manager.context.delete(entity)
        save()
    }
    
    func save() {
        manager.save()
    }
}


