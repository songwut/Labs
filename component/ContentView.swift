//
//  ContentView.swift
//  component
//
//  Created by Songwut Maneefun on 19/1/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: desItemListSwiftUI,
                    label: {
                        Text("Pathway Item list")
                    })
                
                NavigationLink(
                    destination: desPathwayCurriculumSwiftUI,
                    label: {
                        Text("Pathway Detail Curriculum")
                    })
            }
            .navigationTitle("List Example")
            
        }
    }
    
    var desItemListSwiftUI: some View {
        ItemListSwiftUI()
            .environmentObject(PathwayViewModel())
    }
    
    var desPathwayCurriculumSwiftUI: some View {
        PathwayCurriculumSwiftUI()
            .environmentObject(PathwayViewModel())
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
