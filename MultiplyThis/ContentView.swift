//
//  ContentView.swift
//  MultiplyThis
//
//  Created by Yury Prokhorov on 11.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstNumber = 0
    @State private var secondNumber = 0
    
    @State private var numberOfQuestions = 1
    
    
    var body: some View {
        NavigationView {
                   Form {
        Section("How many questions do you want to receive?") {
                            Picker("\(numberOfQuestions) questions", selection: $numberOfQuestions) {
                                ForEach(1..<21){
                                    Text(String($0))
                                }
                        }
        }
                       
                   }
            
        }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
