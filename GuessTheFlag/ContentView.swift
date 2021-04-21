//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Leotis buchanan on 2021-04-21.
//
/*
 
 Buttons in SwiftUI can be made in two ways depending on how they should look.

 The simplest way to make a button is when it just contains some text: you pass in the title of the button,
 along with a closure that should be run when the button is tapped:
 
 */

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            print("button was tapped")
        }) {
            HStack(spacing:10){
                Image(systemName: "pencil")
                    .renderingMode(.original)
                Text("Edit")
                
            }
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
