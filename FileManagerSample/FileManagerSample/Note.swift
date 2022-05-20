//
//  Note.swift
//  FileManagerSample
//
//  Created by Galina Aleksandrova on 09/05/22.
//

import Foundation
struct Note: Codable, Identifiable {
    
    // MARK: - Properties
    var id = UUID()
    let title: String
   // let description: String
}
