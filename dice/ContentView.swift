//
//  ContentView.swift
//  dice
//
//  Created by User17 on 2020/3/25.
//  Copyright © 2020 NTOU. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    @State private var Num : Int = 0
    @State private var color:[Color] = [.black,.blue,.red,.green,.orange,.yellow,.purple]
    var body: some View {
        ZStack{
            Image("star").resizable().scaledToFill().frame(minWidth: 0, maxWidth: .infinity)
        VStack(alignment: .leading){
            ZStack{
                Circle().frame(width:200,height:200).foregroundColor(color[Num])
                Text("\(Num)").font(.system(size: 160)).foregroundColor(Color.white)
            }
            Button(action:{
                let randNum = 1...6
                self.Num = randNum.randomElement()!
                withAnimation(.easeOut(duration: 0.3)){
                    self.animationAmount -= 360
                }
            }){
                Image("casino").renderingMode(.original).resizable().frame(width: 100,height: 100).scaledToFit().shadow(color: color[Num], radius: 50).rotation3DEffect(.degrees(animationAmount), axis: (x: 0.5, y: 0.5, z: 0.5)).opacity(1)
                Text("roll").font(.system(size: 70)).foregroundColor(color[Num])
            }
        }
        
        
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
