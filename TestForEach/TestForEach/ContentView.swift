//
//  ContentView.swift
//  TestForEach
//
//  Created by Pandruz on 12/11/2020.
//

import SwiftUI

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var selectedFolder: FolderModel? = nil
    }
}

struct ContentView: View {
    
    @ObservedObject var cm : FolderModel //Which is conformed to Codable, Identifiable, Equatable, ObservableObject
    @ObservedObject var dm : DataManager //Which is conformed to Equatable, Identifiable, ObservableObject
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(dm.storageFolder) { folder in
                            Button(action: {
                                viewModel.selectedFolder = folder
                            }, label: {
                                Text(folder.name)
                            })
                        }
                        
                        if viewModel.selectedFolder == nil {
                            Form {
                                ForEach(dm.storageValues) { passwordDelForEach in
                                    //                            NavigationLink(//This works correctly)
                                    Text("Here there's a Navigation Link that works")
                                }
                            }
                        } else {
                            ValuesView(cm: viewModel.selectedFolder!, dm: dm, vm: viewModel.selectedFolder!.values)
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
        ContentView(cm: folderDemo, dm: DataManager())
    }
}
