//
//  Note.swift
//  Notes WatchKit Extension
//
//  Created by Micaella Morales on 2/28/22.
//

import Foundation

struct Note: Identifiable, Codable {
  let id: UUID
  let text: String
}
