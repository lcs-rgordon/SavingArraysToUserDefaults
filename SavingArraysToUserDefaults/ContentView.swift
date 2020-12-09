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
                        saveColour()
                    }, label: {
                        Text("Save")
                    })
                    
                }
                
                Section(header: Text("My favourite colours are...")) {
                    // NOTE: If items in a list will be removed later, they really should be made unique. See: https://www.hackingwithswift.com/books/ios-swiftui/working-with-identifiable-items-in-swiftui
                    List(favouriteColours, id: \.self) { colour in
                        Text(colour)
                    }
                    
                }
                
            }
            .navigationTitle("Favourites")
            
        }
        
    }
    
    func saveColour() {
        
        // Add to list
        favouriteColours.append(givenColour)
        
        // DEBUG
        print(favouriteColours)
        
        // Clear the input field
        givenColour = ""

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
