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
                
                NavigationLink(
                    destination: desMyDashboardSwiftUI,
                    label: {
                        Text("My Dashboard")
                    })
            }
            .navigationTitle("List SwiftUI Component")
            
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
    
    var desMyDashboardSwiftUI: some View {
        MyDashboardSwiftUI()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
