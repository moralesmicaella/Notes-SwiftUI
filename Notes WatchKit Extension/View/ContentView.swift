//
//  ContentView.swift
//  Notes WatchKit Extension
//
//  Created by Micaella Morales on 2/28/22.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTY
  @AppStorage("lineCount") var lineCount: Int = 1
  
  @State private var notes: [Note] = [Note]()
  @State private var text: String = ""
  
  // MARK: - FUNCTION
  func getDocumentDirectory() -> URL {
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return path[0]
  }
  
  func save() {
    do {
      let data = try JSONEncoder().encode(notes)
      let url = getDocumentDirectory().appendingPathComponent("notes")
      
      try data.write(to: url)
    } catch {
      print("Saving data has failed!")
    }
  }
  
  func delete(offsets: IndexSet) {
    withAnimation {
      notes.remove(atOffsets: offsets)
      save()
    }
  }
  
  func load() {
    DispatchQueue.main.async {
      do {
        let url = getDocumentDirectory().appendingPathComponent("notes")
        let data = try Data(contentsOf: url)
        
        notes = try JSONDecoder().decode([Note].self, from: data)
      } catch {
        print("No data found")
      }
    }
  }
  
  func addNewNote() {
    guard !text.isEmpty else { return }
    
    let note = Note(id: UUID(), text: text)
    notes.append(note)
    
    text = ""
    
    save()
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
      
      if !notes.isEmpty {
        List {
          ForEach(0..<notes.count, id: \.self) { index in
            NavigationLink(destination: DetailView(note: notes[index], count: notes.count, index: index)) {
              HStack {
                Capsule()
                  .frame(width: 4)
                  .foregroundColor(.accentColor)
                Text(notes[index].text)
                  .lineLimit(lineCount)
                  .padding(.leading, 5)
              }
            } //: HSTACK
          } //: NOTE ITEM
          .onDelete(perform: delete)
        }
      } else {
        Spacer()
        Image(systemName: "note.text")
          .resizable()
          .scaledToFit()
          .foregroundColor(.gray)
          .opacity(0.25)
          .padding(25)
        Spacer()
      } //: LIST
    } //: VSTACK
    .navigationTitle("Notes")
    .navigationBarTitleDisplayMode(.inline)
    .onAppear {
      load()
    }
  }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
