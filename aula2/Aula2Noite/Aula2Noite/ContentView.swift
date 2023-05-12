//
//  ContentView.swift
//  Aula2Noite
//
//  Created by Student18 on 10/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var peso: String = ""
    @State private var altura: String = ""
    @State private var resultado: String = ""
    @State private var backgroundColor: String = "BaixoPesoCor"
    
    var body: some View {
        VStack {
            Text("Calculadora de IMC").font(.title).bold(true)
            TextField("Digite seu peso", text: $peso).multilineTextAlignment(.center).frame(width: 350).textFieldStyle(.roundedBorder)
            TextField("Digite sua altura", text: $altura).multilineTextAlignment(.center).frame(width: 350).textFieldStyle(.roundedBorder)
            Button("Calcular") {
                calcularIMC();
            }.padding(.all, 9.0).background(.blue).foregroundColor(.white).cornerRadius(12)
            Spacer()
            TextField("", text: $resultado).multilineTextAlignment(.center).foregroundColor(.white).font(.largeTitle)
            Spacer()
            Image("imc").resizable().scaledToFill().frame(width: 200, height: 200)
            
        }.background(Color(backgroundColor))
    }
    
    func calcularIMC(){
        let imc = (peso as NSString).doubleValue / ((altura as NSString).doubleValue *  (altura as NSString).doubleValue)
        if imc < 18.5{
            resultado = "Baixo Peso"
            backgroundColor = "BaixoPesoCor"
        }else if imc >= 18.5 && imc < 25 {
            resultado = "Normal"
            backgroundColor = "NormalCor"
        }
        else if imc >= 25 && imc < 30{
            resultado = "Sobrepeso"
            backgroundColor = "SobrepesoCor"
        }else{
            resultado = "Obesidade"
            backgroundColor = "ObesidadeCor"
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
