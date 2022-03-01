//
//  DetailView.swift
//  Notes WatchKit Extension
//
//  Created by Micaella Morales on 2/28/22.
//

import SwiftUI

struct DetailView: View {
  // MARK: - PROPERTY
  @State private var isCreditsPresented: Bool = false
  
  let note: Note
  let count: Int
  let index: Int
  
  // MARK: - BODY
  var body: some View {
    VStack(alignment: .center, spacing: 3) {
      // HEADER
      HeaderView()
      
      // CONTENT
      Spacer()
      
      ScrollView(.vertical) {
        Text(note.text)
          .font(.title3)
          .fontWeight(.semibold)
          .multilineTextAlignment(.center)
      }
      
      Spacer()
      
      // FOOTER
      HStack(alignment: .center) {
        Image(systemName: "gear")
          .imageScale(.large)
        
        Spacer()
        
        Text("\(index + 1) / \(count)")
        
        Spacer()
        
        Image(systemName: "info.circle")
          .imageScale(.large)
          .onTapGesture {
            isCreditsPresented.toggle()
          }
          .sheet(isPresented: $isCreditsPresented) {
            CreditsView()
          }
      } //: HSTACK
      .foregroundColor(.secondary)
    } //: VSTACK
    .padding(3)
  }
}

// MARK: - PREVIEW
struct DetailView_Previews: PreviewProvider {
  static let sampleNote: Note = Note(id: UUID(), text: "Hello, World")
  static var previews: some View {
    DetailView(note: sampleNote, count: 5, index: 1)
  }
}
