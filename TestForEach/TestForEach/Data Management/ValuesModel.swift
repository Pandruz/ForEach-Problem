//
//  PasswordModel.swift
//  Password Safe
//
//  Created by Pandruz on 10/09/2020.
//  Copyright © 2020 Pandruz. All rights reserved.
//

import SwiftUI
import Combine

class ValuesModel : Codable, Identifiable, Equatable, ObservableObject, Comparable {

    var id = UUID()
    var name : String
    var features : String
    var expiring : Date?
    var folder : String?
    var selectedForAFolder : Bool

    init(name: String, features: String, expiring: Date?, folder: String?, selectedForAFolder: Bool) {
    self.name = name
    self.features = features
    self.expiring = expiring
    self.folder = folder
    self.selectedForAFolder = selectedForAFolder
}
    
    var immaginePerCartella: Image {
        
        switch selectedForAFolder {
        case true: return Image(systemName: "checkmark.circle.fill")
        case false: return Image(systemName: "circle")
        }
        
    }
    
    static func == (lhs: ValuesModel, rhs: ValuesModel) -> Bool {
        true
    }
    
    static func < (lhs: ValuesModel, rhs: ValuesModel) -> Bool {
        true
    }
}
