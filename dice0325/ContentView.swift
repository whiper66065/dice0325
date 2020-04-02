//
//  ContentView.swift
//  dice0325
//
//  Created by 潘昱任 on 2020/3/26.
//  Copyright © 2020 ntouyujen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    @State private var Num : Int = 0
    @State private var color:[Color] = [.red,.green,.gray,.pink,.orange,.purple,.yellow]
    @State private var player = ["就是你自己！","Lebron James","Kevin Durant","James Harden","Chris Paul","Anthony Davis","Lou Williams"]
    var body: some View {
        ZStack{
            Image("nbalogoblue")
            .resizable()
            .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
            VStack(alignment: .center){
                Text("看看今天的幸運數字及球員？")
                    .font(.title)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10.0)
                    .offset(x:0, y:-100)
                ZStack{
                    Capsule()
                        .frame(width: 300, height: 200)
                    .foregroundColor(color[Num])
                    Text("\(Num)")
                        .font(.system(size: 150))
                        .foregroundColor(Color.black)
                }
                Button(action:{
                    let randNum = 0...6
                    self.Num = randNum.randomElement()!
                    self.showAlert = true
                }){
                    
                    Text("請按我")
                        .font(.system(size: 50))
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(50)
                        .shadow(radius: 10)
                    
                }
                .offset(x:0, y:200)
            
                .alert(isPresented: $showAlert) { () -> Alert in
                   
                    return Alert(title: Text("您今天的幸運球員是："), message:Text(player[Num]), dismissButton: .cancel())
                    
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
