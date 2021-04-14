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
//                Spacer()
                Score_Label().environmentObject(logicObj)
                Spacer().scaledToFit()
                
                MainRec()
                    .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onEnded(({value in
                        if value.translation.width > 0 {
                            logicObj.collapse(dir: .right)
                        }else if value.translation.width < 0 {
                            logicObj.collapse(dir: .left)
                        }else if value.translation.height > 0 {
                            logicObj.collapse(dir: .down)
                        }else if value.translation.height < 0 {
                            logicObj.collapse(dir: .up)
                        }
                    })))
                    .environmentObject(logicObj)
                
                Spacer()
                    .scaledToFit()
                
                BtnArea(rand:$rand).environmentObject(logicObj)
                Spacer()
                    .scaledToFit()
                RandOrDeter(rand: $rand).environmentObject(logicObj)
                
            }.alert(isPresented:
                        $logicObj.gameOver){
                    Alert(title: Text("Game Over!"),
                          message: Text("Score: \(logicObj.score)"),
                          dismissButton: Alert.Button.default(
                            Text("Start New Game"),
                            action: {
//                                let newScore = Score(score: game.score, time: Date())
//                                scoreList.addScore(newScore)
//                                game.newgame(mode: selectedGameChoice)
                            }
                          )
                    )
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

