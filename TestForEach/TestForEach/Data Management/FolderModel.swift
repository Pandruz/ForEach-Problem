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
    #warning("TODO: Dummy Data added here needs removed")
    var values : [ValuesModel] = [ValuesModel(name: "", features: "", expiring: Date(), folder: "", selectedForAFolder: false)]
    
    init(name: String) {
        self.name = name
    }
    
    static func == (lhs: FolderModel, rhs: FolderModel) -> Bool {
        return lhs.id.uuidString == rhs.id.uuidString
    }
}
