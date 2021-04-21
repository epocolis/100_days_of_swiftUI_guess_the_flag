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
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria","Poland", "Russia", "Spain", "UK", "US"]
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        
        ZStack{
            Color.blue.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack(spacing:30){
                VStack{
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                }
                
                ForEach(0 ..< 3){number in
                    Button(action: {
                        // flag was tapped
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                    }
                }
                
                Spacer()
                
            }
            
        }
        
        
        
        
        
        
           
            
            
        
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
