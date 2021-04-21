//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Leotis buchanan on 2021-04-21.
//
/*
 
 In order for this game to be fun, we need to randomize the order in which flags are shown,
 trigger an alert telling them whether they were right or wrong whenever they
 tap a flag, then reshuffle the flags.

 We already set correctAnswer to a random integer, but the flags always start in the same order.
 To fix that we need to shuffle the countries array when the game starts,
 so modify the property to this:
 
 */

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria","Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
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
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                    }
                }
                
                Spacer()
                
            }
            
        }.alert(isPresented: $showingScore){
            Alert(title:Text(scoreTitle),message:
                  Text("Your score is ???"),
                  dismissButton: .default(Text("Continue")){
                    self.askQuestion()
                  }
                  )
            
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
