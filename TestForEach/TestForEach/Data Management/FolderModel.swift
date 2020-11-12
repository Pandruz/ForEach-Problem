//
//  CartelleModel.swift
//  Passowrd Safe
//
//  Created by Pandruz on 31/10/2020.
//

import SwiftUI
import Combine

class FolderModel : Codable, Identifiable, Equatable, ObservableObject  {

    var id = UUID()
    var name : String
    var values : [ValuesModel] = []
    
    init(name: String) {
        self.name = name
    }
    
    static func == (lhs: FolderModel, rhs: FolderModel) -> Bool {
        return lhs.id.uuidString == rhs.id.uuidString
    }
}
