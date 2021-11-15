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
    @State private var userheight: Double = 0.0
    @State private var weight: Double = 0.0
    @State private var result: Double = 0.0
    var minimumH = 0.0
    var maximumH = 250.0
    var minimumW = 0.0
    var maximumW = 150.0
    var resultBMI: Double {
        if(weight == 0)||(userheight == 0){
            let bmi: Double = 0.00
            return bmi
        }
        else{
            let bmi: Double = (weight*10000)/(userheight*userheight)
            return bmi
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Enter your name")
                TextField("Name", text: $name)
                Spacer()
                    .frame(height: 35)
                VStack {
                    Text("Select your height in centimeter").bold()
                    HStack{
                    Text("\(Int(minimumH))")
                    Slider(value: $userheight, in: minimumH...maximumH)
                    Text("\(Int(maximumH))")
                }
                }
                Text("Your height: \(Int(userheight))")
                Spacer()
                    .frame(height: 35)
                VStack {
                    Text("Select your weight in kilograms").bold()
                    HStack{
                    Text("\(Int(minimumW))")
                    Slider(value: $weight, in: minimumW...maximumW)
                    Text("\(Int(maximumW))")
                }
                }
                Text("Your weight: \(Int(weight))")
                Spacer()
                    .frame(height: 150)
                VStack {
                Text("Your name: \(name)")
                    .bold()
                    .font(.title)
                    Spacer()
                        .frame(height: 35)
                    Text("Your BMI: \(resultBMI, specifier: "%.2f")")
                    .bold()
                    .font(.title)
                    Spacer()
                }
            }
        .padding()
            .navigationBarTitle(Text("BMI Calculator"), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

