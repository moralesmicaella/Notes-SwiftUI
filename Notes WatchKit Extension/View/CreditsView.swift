//
//  CreditsView.swift
//  Notes WatchKit Extension
//
//  Created by Micaella Morales on 2/28/22.
//

import SwiftUI

struct CreditsView: View {
  // MARK: - BODY
  var body: some View {
    VStack(spacing: 3) {
      // PROFILE IMAGE
      Image("developer-no2")
        .resizable()
        .scaledToFit()
        .layoutPriority(1)
      
      // HEADER
      HeaderView(title: "Credits")
      
      // CONTENT
      Text("Micaella Morales")
        .foregroundColor(.primary)
        .fontWeight(.bold)
      Text("Developer")
        .font(.footnote)
        .foregroundColor(.secondary)
        .fontWeight(.light)
    } //: VSTACK
  }
}

// MARK: - PREVIEW
struct CreditsView_Previews: PreviewProvider {
  static var previews: some View {
    CreditsView()
  }
}
