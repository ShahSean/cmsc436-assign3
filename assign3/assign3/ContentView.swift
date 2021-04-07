//
//  ContentView.swift
//  assign3
//
//  Created by Shahryar shagoshtasbi on 4/6/21.
//


import SwiftUI

struct ContentView: View {
    
    @StateObject var logicObj = Triples()
    @State var rand: Bool = true
    
    
    var body: some View {
        ZStack{
            Color(red:250 / 255 , green: 200 / 255 , blue:135 / 255)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Score_Label().environmentObject(logicObj)
                Spacer().scaledToFit()
                
                MainRec().environmentObject(logicObj)
                Spacer()
                    .scaledToFit()
                BtnArea(rand:$rand).environmentObject(logicObj)
                Spacer()
                    .scaledToFit()
                RandOrDeter(rand: $rand).environmentObject(logicObj)
                
            }
            
        }.onAppear{
            logicObj.newgame(rand: true)
            //        }.alert(isPresented: logicObj.gameOver){
            //            Alert(title: Text("Game Over"), message: Text("Your Score is \(logicObj.score)"), primaryButton: .destructive(Text("New Game"), action:{ logicObj.newgame(rand: false)}), secondaryButton: .cancel(Text("boo"), action: {}))
            //        }
        }
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

