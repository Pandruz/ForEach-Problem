//
//  DataManager.swift
//  Passowrd Safe
//
//  Created by Pandruz on 31/10/2020.
//

import SwiftUI
import Combine

class DataManager : Equatable, Identifiable, ObservableObject {
    
    static let shared = DataManager()
    
    @Published var storageValues : [ValuesModel] = []
    typealias StorageValues = [ValuesModel]
    
    
    @Published var storageFolder : [FolderModel] = []
    typealias StorageFolders = [FolderModel]
    
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    init() { load() }
    
    
    var filePathValues : String = ""
    var filePathFolder : String = ""
    
    func save() {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        do {
            let dataValues = try encoder.encode(storageValues)
            let dataFolder = try encoder.encode(storageFolder)

            try dataValues.write(to: URL(fileURLWithPath: filePathValues))
            try dataFolder.write(to: URL(fileURLWithPath: filePathFolder))
        } catch {
            debugPrint(error.localizedDescription)
        }
        objectWillChange.send()
    }
    
    
    func load() {
        filePathValues = folderDocuments() + "/values.plist"
        filePathFolder = folderDocuments() + "/folders.plist"
        
        if FileManager.default.fileExists(atPath: filePathValues) && FileManager.default.fileExists(atPath: filePathFolder) {
            do {
                let datavalues = try Data(contentsOf: URL(fileURLWithPath: filePathValues))
                let datafolders = try Data(contentsOf: URL(fileURLWithPath: filePathFolder))
                
                let decoder = PropertyListDecoder()
                
                storageValues = try decoder.decode(StorageValues.self, from: datavalues)
                storageFolder = try decoder.decode(StorageFolders.self, from: datafolders)
            } catch {
                debugPrint(error.localizedDescription)
            }
        } else {
            
            let value1 = ValuesModel(name: "Name 1", features: "Feature 1", expiring: nil, folder: nil, selectedForAFolder: false)
            
            let value2 = ValuesModel(name: "Name 2", features: "Feature 2", expiring: nil, folder: nil, selectedForAFolder: false)
            
            let value3 = ValuesModel(name: "Name 3", features: "Feature 3", expiring: nil, folder: nil, selectedForAFolder: false)
            
            let folder1 = FolderModel(name: "Folder 1")

            storageValues = [value1, value2, value3]
            storageFolder.insert(folder1, at: 0)
            
            save()
            
        }
    }
    
    func folderDocuments() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        //print(paths[0])
        return paths[0]
    }

    
    
    
    func newFolder(name: String, values: [ValuesModel]?) {
        let folder = FolderModel(name: name)
        if let valuesOK = values {
            folder.values = valuesOK
        }
        storageFolder.insert(folder, at: 0)
        save()
    }
    
    func cancellaCartella(index: Int) {
        objectWillChange.send()
        guard storageFolder.indices.contains(index) else { return }
        storageFolder.remove(at: index)
        save()
    }
    
       
    static func == (lhs: DataManager, rhs: DataManager) -> Bool {
        true
    }
    
}
