//
//  DataProvider.swift
//  FileManagerSample
//
//  Created by Galina Aleksandrova on 09/05/22.
//

import Foundation
class DataProvider: ObservableObject {

    @Published var allNotes = [Note]()
    private let dataSourceURL: URL
    static let shared = DataProvider()
    
    private func getAllNotes() -> [Note] {
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: dataSourceURL)
            let decodedNotes = try! decoder.decode([Note].self, from: data)
                
            return decodedNotes
        } catch {
            return []
        }
    }
    
    
    private func saveNotes() {
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(allNotes)
            try data.write(to: dataSourceURL)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func create(note: Note) {
        allNotes.insert(note, at: 0)
        saveNotes()
    }
    
    func changeNote(note: Note, index: Int) {
        allNotes[index] = note
        saveNotes()
    }
    
    func delete(_ offsets: IndexSet) {
        allNotes.remove(atOffsets: offsets)
        saveNotes()
    }
    
    func move(source: IndexSet, destination: Int) {
        allNotes.move(fromOffsets: source, toOffset: destination)
        saveNotes()
    }
    
    // MARK: - Life Cycle
    init() {
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let notesPath = documentsPath.appendingPathComponent("notes").appendingPathExtension("json")
        dataSourceURL = notesPath
           
        _allNotes = Published(wrappedValue: getAllNotes())
    }
}
