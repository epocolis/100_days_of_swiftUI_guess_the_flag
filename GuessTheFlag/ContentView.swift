//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Leotis buchanan on 2021-04-21.
//
/*
 
 SwiftUI gives us three kinds of gradients to work with, and like colors they are also views that can be drawn in our UI.

 Gradients are made up of several components:

 An array of colors to show
 Size and direction information
 The type of gradient to use
 For example, a linear gradient goes in one direction, so we provide it with a start and end point like this:
 
 All of these gradients are able to stand alone as views, or be used as part of a modifier – you can use them as the background for a text
 view, for example.
 
 */

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
            RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
