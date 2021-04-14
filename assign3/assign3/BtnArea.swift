//
//  BtnArea.swift
//  assign3
//
//  Created by Shahryar shagoshtasbi on 4/6/21.
//

import SwiftUI

struct BtnArea: View {
    @Binding var rand:Bool
    
    @EnvironmentObject var logicObj : Triples
    var body: some View {
        
        VStack{
            Spacer()
            
            Button("Up"){
                logicObj.collapse(dir: Direction.up)
                logicObj.spawn()
            }.buttonStyle(CustomBtnStyle())
                
            HStack{
                
                Spacer()
                
                Button("Left"){
                    logicObj.collapse(dir: Direction.left)
                    logicObj.spawn()
                }.buttonStyle(CustomBtnStyle())
                
                Spacer()
                
                Button("Right"){
                    logicObj.collapse(dir: Direction.right)
                    logicObj.spawn()
                }.buttonStyle(CustomBtnStyle())
                
                Spacer()
            }
                
            Button("Down"){
                logicObj.collapse(dir: Direction.down)
                logicObj.spawn()
            }.buttonStyle(CustomBtnStyle())
            Spacer()
    }
        HStack{
            Button("New Game"){
                logicObj.gameOver = true
            }
            .frame(minWidth: 90, idealWidth: 150, maxWidth: 200, minHeight: 20, idealHeight: 40, maxHeight: 50, alignment: .center)
            .grayscale(/*@START_MENU_TOKEN@*/0.50/*@END_MENU_TOKEN@*/)
            .border(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/, width: 0.2)
            .background(Color.orange)
            .cornerRadius(8)
            .font(.system(size: 24, weight: .bold))
        
        }
    }
}

struct CustomBtnStyle: ButtonStyle{
    
    func makeBody(configuration: Self.Configuration) -> some View {
            return configuration.label
                .padding()
                .grayscale(/*@START_MENU_TOKEN@*/0.50/*@END_MENU_TOKEN@*/)
                .border(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                .background(/*@START_MENU_TOKEN@*/Color(hue: 0.452, saturation: 0.334, brightness: 0.696)/*@END_MENU_TOKEN@*/)
                .cornerRadius(8)
                .font(.system(size: 15, weight: .bold))
    }
}


//s

