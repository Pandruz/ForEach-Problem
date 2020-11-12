//
//  TestForEachApp.swift
//  TestForEach
//
//  Created by Pandruz on 12/11/2020.
//

import SwiftUI

@main
struct TestForEachApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(cm: folderDemo, dm: DataManager())
        }
    }
}
