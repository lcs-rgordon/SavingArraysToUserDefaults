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
    
    // The UserDefaults key for reading/writing the array
    private let favouriteColoursKey = "favouriteColours"
    
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
        // See: https://www.hackingwithswift.com/books/ios-swiftui/how-to-be-notified-when-your-swiftui-app-moves-to-the-background
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            
            // DEBUG
            print("Moving to the background!")
            
            // Gain access to user defaults
            let defaults = UserDefaults.standard
            
            // Save the array of favourite colours to user defaults using the specified key
            defaults.set(favouriteColours, forKey: favouriteColoursKey)
            
        }
        .onAppear() {
            
            // When app is opened, retrieve data from UserDefaults storage
            print("Moving back to the foreground!")
            
            // Gain access to user defaults
            let defaults = UserDefaults.standard
            
            // Get the array – we need to remind the compiler of the type, so we cast from Any? to [String]
            // If the cast fails, it will set the array to an empty array through the use of the ?? nil coalescing operator
            favouriteColours = defaults.object(forKey: favouriteColoursKey) as? [String] ?? []
                        
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
