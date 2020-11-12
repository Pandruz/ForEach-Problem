//
//  ContentView.swift
//  TestForEach
//
//  Created by Pandruz on 12/11/2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var cm : FolderModel //Which is conformed to Codable, Identifiable, Equatable, ObservableObject
    @ObservedObject var dm : DataManager //Which is conformed to Equatable, Identifiable, ObservableObject
    @State var pressedFolder = false
    @State var valview : ValuesView
    
    var body: some View {
    NavigationView {
        VStack{
            ScrollView(.horizontal) {
                HStack {
                    ForEach(dm.storageFolder) { foldersForEach in
                    Button(action: {
                        valview = ValuesView(cm: foldersForEach, dm: dm, vm: foldersForEach.values)
                        pressedFolder = true
                    }, label: {
                        Text(foldersForEach.name)})
                }
                
                if pressedFolder == false {
                    Form {
                        ForEach(dm.storageValues) { passwordDelForEach in
//                            NavigationLink(//This works correctly)
                            Text("Here there's a Navigation Link that works")
                        }
                    }
                    
                } else if pressedFolder == true {
                    valview //This is the thing that it's not updating when values are added to the folders
                }
                }
            }
        }
    }
    }

//struct ValuesView : View {
//
//                    @ObservedObject var cm : FolderModel //Which is conformed to Codable, Identifiable, Equatable, ObservableObject
//                    @ObservedObject var dm : DataManager //Which is conformed to Equatable, Identifiable, ObservableObject
//
//                    var body : some View {
//                        Form {
//                            ForEach (cm.folderValues) { folderValuesForEach in
//                                NavigationLink(//This works correctly)
//                            }
//                        }
//                    }
//                }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cm: folderDemo, dm: DataManager(), valview: ValuesView(cm: folderDemo, dm: DataManager(), vm: folderDemo.values))
    }
}
