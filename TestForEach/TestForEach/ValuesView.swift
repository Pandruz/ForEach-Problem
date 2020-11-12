//
//  PasswordListView.swift
//  testcartelleinhome
//
//  Created by Pandruz on 05/11/2020.
//

import SwiftUI
import Combine

struct ValuesView: View {
    
    @ObservedObject var cm : FolderModel
    @ObservedObject var dm : DataManager
    var vm : [ValuesModel]
    
    
    var body: some View {
        #warning("TODO: Having Form here is preventing the text from displaying.. im not sure why")
        //Form {
            ForEach(vm) { valuesForEach in
                
//                NavigationLink() This works correctly
                        Text(valuesForEach.name)
                Text("Here there's a Navigation Link that works")

                    
            }
       // }
    }
}

struct ValuesView_Previews: PreviewProvider {
    static var previews: some View {
        ValuesView(cm: folderDemo, dm: DataManager(), vm: folderDemo.values)
    }
}
