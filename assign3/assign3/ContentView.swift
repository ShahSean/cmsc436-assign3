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
    @Environment(\.verticalSizeClass) var verticalSizeClass
    var viewM = false
    
    var body: some View {
        ZStack{
            Color(red:250 / 255 , green: 200 / 255 , blue:135 / 255)
                .ignoresSafeArea()
            if verticalSizeClass == .regular{
                VStack{
                    Score_Label().environmentObject(logicObj)
                    MainRec()
                        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                        .onEnded({ value in
                            
                            if (abs(value.startLocation.x - value.location.x) > abs(value.startLocation.y - value.location.y)){
                                if value.startLocation.x > value.location.x {
                                    withAnimation {
                                        logicObj.collapse(dir: Direction.left)
                                        logicObj.spawn();
                                    }
                                } else if value.startLocation.x < value.location.x {
                                    withAnimation {logicObj.collapse(dir: Direction.right)
                                        logicObj.spawn();
                                    }
                                }
                            }else{
                                if value.startLocation.y < value.location.y {
                                    withAnimation {logicObj.collapse(dir: Direction.down)
                                        logicObj.spawn();
                                    }
                                } else if value.startLocation.y > value.location.y {
                                    withAnimation {logicObj.collapse(dir: Direction.up)
                                        logicObj.spawn();
                                    }
                                }
                            }
                            
                        }))
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
            }else { // Landscape View
                HStack{
                    VStack{
                        
                        
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
                        
                    }
                    Spacer()
                    VStack{
                        Spacer().scaledToFit()
                        BtnArea(rand:$rand).environmentObject(logicObj)
                        Spacer().scaledToFit()
                        
                        
                        //                        Spacer()
                    }
                    Spacer()
                    VStack{
                        Spacer()
                        Score_Label().environmentObject(logicObj)
                        Spacer()
                        RandOrDeter(rand: $rand).environmentObject(logicObj)
                        Spacer()
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

