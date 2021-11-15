//
//  ContentView.swift
//  calculator
//
//  Created by macOS on 3/21/1400 AP.
//  Copyright © 1400 macOS. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var heiGht: Double = 0.0
    @State private var weight: Double = 0.0
    @State var showAlert: Bool = false
    var minimumHeight = 0.0
    var maximumHeight = 220.0
    var minimumWeight = 0.0
    var maximumWeight = 150.0
    var result: Double {
        if(weight == 0)||(heiGht == 0){
            let bmiValue: Double = 0.0
            return bmiValue
        }
        else{
            let bmiValue: Double = (weight*10000)/(heiGht*heiGht)
            return bmiValue
        }
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Enter your name").bold().foregroundColor(.blue)
                TextField("Name", text: $name)
                VStack{
                    Spacer()
                    .frame(height: 40)
                Text("Position your height in centimeter").foregroundColor(.blue)
                HStack{
                        Text("\(Int(minimumHeight))")
                        Slider(value: $heiGht, in:minimumHeight...maximumHeight)
                            .accentColor(Color.blue)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(lineWidth: 2.0)
                                    .foregroundColor(Color.blue)
                            )
                        Text("\(Int(maximumHeight))")
                    }
                    }
                Text("\(Int(heiGht))")
                Spacer()
                    .frame(height: 40)
                Text("Position your weight in kilograms").foregroundColor(.blue)
                HStack{
                    Text("\(Int(minimumWeight))")
                    Slider(value: $weight, in:minimumWeight...maximumWeight)
                    .accentColor(Color.blue)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2.0)
                            .foregroundColor(Color.blue)
                        )
                    Text("\(Int(maximumWeight))")
                }
                Text("\(Int(weight))")
                Spacer()
            Button(action: {
                self.showAlert = true
            }, label:{
            Text("Calculate")
            .foregroundColor(.white)
            .font(.system(size: 24))
            })
                .frame(width: 200, height: 50, alignment: .center)
                .background(Color.blue)
                .cornerRadius(10)
            }
            .alert(isPresented: $showAlert){
                Alert(
                    title: Text("Hello \(self.name)"),
                    message: Text("Your BMI is: \(result, specifier: "%.2f")"),
                    dismissButton: .default(Text("Got it"))
                    )
        }
            .navigationBarTitle(Text("BMI Calculator"), displayMode: .inline)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

