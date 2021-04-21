//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Leotis buchanan on 2021-04-21.
//
/*
 
 If something important happens, a common way of notifying the user is using an alert –
 a pop up window that contains a title, message, and one or two buttons
 depending on what you need.

 But think about it: when should an alert be shown and how? Views are a function of our program state,
 and alerts aren’t an exception to that. So, rather than
 saying “show the alert”, we instead create our alert and set the conditions under which it should be shown.

 A basic SwiftUI alert has a title, message, and one dismiss button, like this:
 
 */

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show Alert") {
            self.showingAlert = true
        }
        .alert(isPresented: $showingAlert){
            Alert(title:Text("Hello SwiftUI"),
                  message: Text("This is some detail message"),
                  dismissButton: .default(Text("Ok")))
            
        }
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
