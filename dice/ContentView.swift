//
//  ContentView.swift
//  dice
//
//  Created by User17 on 2020/3/25.
//  Copyright © 2020 NTOU. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    @State private var animationAmount = 0.0
    @State private var Num : Int = 0
    @State private var color:[Color] = [.black,.blue,.red,.green,.orange,.yellow,.purple]
    @State private var lunch = ["無","炒飯","肉燥飯","雞肉飯","雞腿飯","雞排飯","燴飯"]
    var body: some View {
        ZStack(alignment: .bottom){
            Image("star").resizable().scaledToFill().frame(minWidth: 0, maxWidth: .infinity)
        VStack(alignment: .center){
            Text("讓蛇丸幫你決定今天吃什麼？").font(.system(size: 50)).foregroundColor(Color.white)
                .padding(.bottom)
            
            
            ZStack{
                Circle().frame(width:200,height:200).foregroundColor(color[Num])
                Text("\(Num)").font(.system(size: 160)).foregroundColor(Color.white)
            }
            Button(action:{
                let randNum = 1...6
                self.Num = randNum.randomElement()!
                withAnimation(.default){
                    self.animationAmount -= 360
                }
                self.showAlert = true
            }){
                Image("casino").renderingMode(.original).resizable().frame(width: 100,height: 100).scaledToFit().shadow(color: color[Num], radius: 50).rotation3DEffect(.degrees(animationAmount), axis: (x: 0.5, y: 0.5, z: 0.5))
                Text("我骰!").font(.system(size: 50)).foregroundColor(.black).padding().background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 255/255, green: 217/255, blue: 218/255), Color.init(red: 204/255, green: 113/255, blue: 120/255)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))).cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 5))
                
                
            }.alert(isPresented: $showAlert) { () -> Alert in
               
               return Alert(title: Text(lunch[Num]))
            }
            
            Image("蛇丸").resizable().scaledToFill().frame(width: 180,height: 180)
        }
        
        
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
