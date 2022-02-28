//
//  ContentView.swift
//  Notes WatchKit Extension
//
//  Created by Micaella Morales on 2/28/22.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTY
  @State private var notes: [Note] = [Note]()
  @State private var text: String = ""
  
  // MARK: - FUNCTION
  func addNewNote() {
    guard !text.isEmpty else { return }
    
    let note = Note(id: UUID(), text: text)
    notes.append(note)
    
    text = ""
    
    dump(notes)
  }
  
  // MARK: - BODY
  var body: some View {
    VStack {
      HStack(alignment: .center, spacing: 6) {
        TextField("Add New Note", text: $text)
        
        Button(action: addNewNote) {
          Image(systemName: "plus.circle")
            .font(.system(size: 42, weight: .semibold))
        }
        .buttonStyle(.plain)
        .fixedSize()
        .foregroundColor(.accentColor)
      } //: HSTACK
      
      Spacer()
      
      Text("\(notes.count)")
    } //: VSTACK
    .navigationTitle("Notes")
    .navigationBarTitleDisplayMode(.inline)
  }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
