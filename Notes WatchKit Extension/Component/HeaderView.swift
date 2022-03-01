//
//  HeaderView.swift
//  Notes WatchKit Extension
//
//  Created by Micaella Morales on 2/28/22.
//

import SwiftUI

struct HeaderView: View {
  // MARK: - PROPERTY
  var title: String = ""
  
  // MARK: - BODY
  var body: some View {
    VStack {
      if !title.isEmpty {
        Text(title.uppercased())
          .font(.title3)
          .fontWeight(.bold)
          .foregroundColor(.accentColor)
      }
      
      HStack {
        Capsule()
          .frame(height: 1)
        
        Image(systemName: "note.text")
        
        Capsule()
          .frame(height: 1)
      } //: HSTACK
      .foregroundColor(.accentColor)
    } //: VSTACK
  }
}

// MARK: - PREVIEW
struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      HeaderView(title: "Credits")
      HeaderView()
    }
  }
}
