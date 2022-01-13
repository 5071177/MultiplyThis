//
//  ContentView.swift
//  MultiplyThis
//
//  Created by Yury Prokhorov on 11.01.2022.
//

import SwiftUI


// TODO: Добавить guard на количество вопросов (больше 0)
// TODO: Добавить guard на максимальное число (больше 4)
// TODO: Добавить наполнение групп рандомными числами от 1 до maxNumber


struct ContentView: View {
    
    @State private var maxNumber = 0
    @State private var numberOfQuestions = 0
    @State private var listOfQuestions = ["test", "test2"]
    
    @State private var firstGroup = [4]
    @State private var secondGroup = [4]
    
    @State private var playerScore = 0
    
    
    func getNumbers(group: Array<Any>, maxnumber: Int) -> Array<Any> {
        
        let allNumbers = 4...maxNumber
        
        for num in 0...numberOfQuestions{
            group.append(allNumbers.randomElement())
        }
        
        return group
    }
    
    
    func startGame() {
        
        playerScore = 0
        
        
        listOfQuestions.removeAll()
        
        
        getNumbers(group: firstGroup, maxnumber: maxNumber)
        getNumbers(group: secondGroup, maxnumber: maxNumber)
        
        
        for number in 4..<maxNumber{
            listOfQuestions.append("\(number) * \(number)")
        }
        
        
        return
    }
    
    var body: some View {
        NavigationView {
                   Form {
        Section("How many questions do you want to receive?") {
            Stepper("\(numberOfQuestions) questions", value: $numberOfQuestions, in: 0...20, step: 5)

        }
                       
        Section("Choose the maximum number you want to practice with"){
            Picker("\(maxNumber)", selection: $maxNumber) {
                ForEach(4..<13){
                    Text("\($0)")
                               }
                           }
                       }
                       Section("Press button to start the game"){
                           Button("Start game", action: startGame)}
                       
                       Section("Answer questions bellow"){
                       List{
                           ForEach(listOfQuestions, id: \.self){
                               Text($0)
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
