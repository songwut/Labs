//
//  DisclosureGroupNew.swift
//  component
//
//  Created by Songwut Maneefun on 26/2/23.
//

import SwiftUI
struct TestButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        HStack {
            Spacer()
            Image(systemName: "pencil")
        }
    }
}


struct DisclosureGroupNew: View {
    @State var show = false
    @State var selectedCountry = ""

    var body: some View {
        VStack {
            DisclosureGroup(isExpanded: $show) {
                
            } label: {
                
            }

            DisclosureGroup(isExpanded: $show) {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 15) {
                        ForEach(0...20, id: \.self) { index in
                            Text("Country \(index)")
                                .onTapGesture {
                                    selectedCountry = "Country \(index)"
                                    withAnimation {
                                        show.toggle()
                                    }
                                }
                        }
                    }
                }
                .padding(.top)
                .frame(height: 150) // if you need a fixed size

            } label: {
                Text("Label")
            }
            .buttonStyle(TestButtonStyle()).accentColor(.gray)
            .padding()
            .background(Color.black.opacity(0.06).onTapGesture {
                show.toggle()
            })
            .cornerRadius(12)
            .padding()
            
            Text("Selected country: \(selectedCountry)")
            Spacer()
        }
    }
    
}

struct DisclosureGroupNew_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureGroupNew()
    }
}
