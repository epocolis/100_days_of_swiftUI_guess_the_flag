//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Leotis buchanan on 2021-04-21.
//
/*
 
 Our game now works, although it doesn’t look great. Fortunately,
 we can make a few small tweaks to our design to make the whole thing look better.

 First, let’s replace the solid blue background color with a linear gradient
 from blue to black, which ensures that even if a flag has a similar blue stripe
 it will still stand out against the background.


 
 */

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria","Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var totalScore = 0
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing:30){
                VStack{
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3){number in
                    Button(action: {
                        // flag was tapped
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.blue, lineWidth: 0.5))
                            .shadow(color: .gray, radius: 2)
                    }
                }
                
                Text("Your current score is \(score)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                
                Spacer()
                
            }
            
        }.alert(isPresented: $showingScore){
            Alert(title:Text(scoreTitle),message:
                    Text("Your score is `\(score)"),
                  dismissButton: .default(Text("Continue")){
                    self.askQuestion()
                  }
            )
            
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            let c = countries[number]
            scoreTitle = "Wrong! That's the flag of \(c)"
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
