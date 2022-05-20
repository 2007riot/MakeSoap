//
//  ContentView.swift
//  FileManagerSample
//
//  Created by Galina Aleksandrova on 09/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var dataProvider = DataProvider.shared
    @State private var alertShowing = false
    @State private var editMode: EditMode = .inactive
    
    
    var body: some View {
        NavigationView {
                   List {
                       ForEach(dataProvider.allNotes) { note in
                          NoteListCell(note: note)
                       }
                       .onDelete(perform: dataProvider.delete)
                       .onMove(perform: dataProvider.move)
                   }
                   .navigationTitle(Text("Notes"))
                   
                   .navigationBarItems(
                       leading: EditButton(),
                       trailing: AddButton(editMode: $editMode, alertShowing: $alertShowing)
                   )
                   .environment(\.editMode, $editMode)
                   .listStyle(InsetListStyle())
                   .textFieldAlert(isPresented: $alertShowing) {
                       TextFieldAlert(title: "Write a note!", message: "What are you thinking about?")
                  
                   
               }
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct NoteListCell: View {
    
    // MARK: - Properties
    let note: Note
    
    // MARK: - UI Elements
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(note.title)")
                .font(.headline)
            
           
        }
    }
}

struct AddButton: View {

    // MARK: - Properties
    @Binding var editMode: EditMode
    @Binding var alertShowing: Bool

    // MARK: - UI Elements
    var body: some View {
        if editMode == .inactive {
            return AnyView(Button(action: {
                    withAnimation {
                        if alertShowing {
                            alertShowing = false
                        } else {
                            alertShowing = true
                        }
                    }
                }) {
                    Image(systemName: "plus.circle.fill")
                })
        } else {
            return AnyView(EmptyView())
        }
    }
}
}
