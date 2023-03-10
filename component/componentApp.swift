//
//  componentApp.swift
//  component
//
//  Created by Songwut Maneefun on 19/1/23.
//

import SwiftUI

@main
struct componentApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            ItemListSwiftUI()
//                .environmentObject(PathwayViewModel())
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
//            PathwayCurriculumSwiftUI()
//                .environmentObject(PathwayViewModel())
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
    }
}
