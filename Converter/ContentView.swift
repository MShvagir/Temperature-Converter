//
//  ContentView.swift
//  Converter
//
//  Created by Romy Shvagir
//

import SwiftUI

struct ContentView: View {
    @State private var numberOne: Double = 1.0
    @State private var selectedOne = "°C"
    @State private var selectedTwo = "°F"
    let systems = ["°F", "K", "°C"]
    var converted: Double {
        if selectedOne == "°C" {
            if selectedTwo == "°F" {
                return 9/5 * numberOne + 32
            } else if selectedTwo == "K" {
                return numberOne + 273.15
            }
        } else if selectedOne == "°F" {
            if selectedTwo == "°C" {
                return (numberOne - 32) * 5/9
            } else if selectedTwo == "K" {
                return (numberOne + 459.67) * 5/9
            }
        } else if selectedOne == "K" {
            if selectedTwo == "°C" {
                return numberOne - 273.15
            } else if selectedTwo == "°F" {
                return numberOne * 9/5 - 459.67
            }
        }
        return numberOne
    }
    var body: some View {
        NavigationView {
            HStack {
                Form {
                    HStack {
                    Picker(selection: $selectedOne) {
                        ForEach(systems, id: \.self) {
                            Text($0)
                        }
                    } label: {
                        Text("Choose")
                    }
                    .pickerStyle(.menu)
                        TextField("temperature", value: $numberOne, format: .number)
                }
                }
                .navigationTitle("Temperature converter")
            .navigationBarTitleDisplayMode(.inline)
            .cornerRadius(15)
                Text("=")
                    .padding(.top)
                Form {
                    HStack {
                        Text(String(format: "%.2f", converted))
                            Spacer()
                    Picker(selection: $selectedTwo) {
                        ForEach(systems, id: \.self) {
                            Text($0)
                        }
                    } label: {
                        Text("Choose")
                    }
                    .pickerStyle(.menu)
                }
                }
                .cornerRadius(15)
            }
            .frame(height: 100)
            .padding()
            .offset(y: -330)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
