//
//  Utils.swift
//  Pizza List
//
//  Created by Marcello Catelli
//  Copyright © Swift srl. All rights reserved.
//

import SwiftUI
import UIKit
import Foundation

let folderDemo = FolderModel(name: "Folder Demo")

func bindBool() -> Binding<Bool> {
    var boolVariable : Bool = true
    let boolVariableBinding : Binding<Bool> = Binding(get: { boolVariable }, set: { boolVariable = $0 })
    return boolVariableBinding
}

func bindText() -> Binding<Text> {
    var boolVariable : Text = Text("")
    let boolVariableBinding : Binding<Text> = Binding(get: { boolVariable }, set: { boolVariable = $0 })
    return boolVariableBinding
}
