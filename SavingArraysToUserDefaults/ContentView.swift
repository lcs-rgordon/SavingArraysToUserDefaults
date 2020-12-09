//
//  ContentView.swift
//  SavingArraysToUserDefaults
//
//  Created by Russell Gordon on 2020-12-09.
//

import SwiftUI

struct ContentView: View {
    
    // The new colour just entered
    @State private var givenColour = ""
    
    // The list of favorite colours
    @State private var favouriteColours: [String] = []
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("Enter a favourite colour...")) {
                    
                    TextField("e.g.: blue", text: $givenColour)
                    
                    Button(action: {
                        
                        // Add to list
                        favouriteColours.append(givenColour)
                        
                        // DEBUG
                        print(favouriteColours)
                        
                        // Clear the input field
                        givenColour = ""
                        
                    }, label: {
                        Text("Save")
                    })
                    
                }
                
            }
            .navigationTitle("Favourites")
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
