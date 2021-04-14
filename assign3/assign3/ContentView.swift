//
//  ContentView.swift
//  assign3
//
//  Created by Shahryar shagoshtasbi on 4/6/21.
//


import SwiftUI

struct ContentView: View {
    @EnvironmentObject var scoreList: ScoreList
    @StateObject var logicObj = Triples()
    @State var rand: Bool = true
    //        .environmentObject(scoreList)
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        ZStack{
            Color(red:250 / 255 , green: 200 / 255 , blue:135 / 255)
                .ignoresSafeArea()
            if verticalSizeClass == .regular{
                VStack{
                    //                Spacer()
                    Score_Label().environmentObject(logicObj)
                    Spacer().scaledToFit()
                    
                    MainRec()
                        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onEnded(({value in
                            if value.translation.width > 0 {
                                logicObj.collapse(dir: .right)
                                logicObj.spawn()
                            }else if value.translation.width < 0 {
                                logicObj.collapse(dir: .left)
                                logicObj.spawn()
                            }else if value.translation.height > 0 {
                                logicObj.collapse(dir: .down)
                                logicObj.spawn()
                            }else if value.translation.height < 0 {
                                logicObj.collapse(dir: .up)
                                logicObj.spawn()
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
                                let newScore = Score(score: logicObj.score, time: Date())
                                scoreList.addNewScore(score: newScore)
                                logicObj.newgame(rand: rand)
                            }
                          )
                    )
                }
            }else { // Horizantal View
                HStack{
                    VStack{
                        
//                        Spacer().scaledToFit()
                        
                        MainRec()
                            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onEnded(({value in
                                if value.translation.width > 0 {
                                    logicObj.collapse(dir: .right)
                                    logicObj.spawn()
                                }else if value.translation.width < 0 {
                                    logicObj.collapse(dir: .left)
                                    logicObj.spawn()
                                }else if value.translation.height > 0 {
                                    logicObj.collapse(dir: .down)
                                    logicObj.spawn()
                                }else if value.translation.height < 0 {
                                    logicObj.collapse(dir: .up)
                                    logicObj.spawn()
                                }
                            })))
                            .environmentObject(logicObj)
                        
                        Spacer()
                            .scaledToFit()
                    }
                    Spacer()
                    VStack{
                        Spacer().scaledToFit()
                        BtnArea(rand:$rand).environmentObject(logicObj)
                        Spacer().scaledToFit()
                           

//                        Spacer()
                    }
                    VStack{
                        Score_Label().environmentObject(logicObj)
                        RandOrDeter(rand: $rand).environmentObject(logicObj)
                    }
                   
                    
                }.alert(isPresented:
                            $logicObj.gameOver){
                    Alert(title: Text("Game Over!"),
                          message: Text("Score: \(logicObj.score)"),
                          dismissButton: Alert.Button.default(
                            Text("Start New Game"),
                            action: {
                                let newScore = Score(score: logicObj.score, time: Date())
                                scoreList.addNewScore(score: newScore)
                                logicObj.newgame(rand: rand)
                            }
                          )
                    )
                }
            }
        }.onAppear{
            logicObj.newgame(rand: true)
        }
    }
    
    
    
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

