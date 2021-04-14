//
//  MiniRec.swift
//  assign3
//
//  Created by Shahryar shagoshtasbi on 4/6/21.
//

import SwiftUI

struct MiniRec: View {
    @EnvironmentObject var logicObj : Triples
    @State var value:Int
    var body: some View {
        
        if value == 0{
            Rectangle()
                .fill(Color(red:159 / 255 , green: 166 / 255 , blue:128 / 255))
                .frame(width:85, height: 85)
                .border(Color(hue: 0.452, saturation: 0.334, brightness: 0.696), width: 10)
                .padding(-5)
                
        }
        if value == 1{
            Rectangle()
                .fill(Color(red:41 / 255 , green: 102 / 255 , blue:242 / 255))
                .frame(width:85, height: 85)
                .border(Color(hue: 0.452, saturation: 0.334, brightness: 0.696), width: 10)
                .padding(-5)
                
        }
        if value == 2{
            Rectangle()
                .fill(Color(red:242 / 255 , green: 58 / 255 , blue:41 / 255))
                .frame(width:85, height: 85)
                .border(Color(hue: 0.452, saturation: 0.334, brightness: 0.696), width: 10)
                .padding(-5)
        }
        if value == 3{
            Rectangle()
                .fill(Color(red:197 / 255 , green: 145 / 255 , blue:242 / 255))
                .frame(width:85, height: 85)
                .border(Color(hue: 0.452, saturation: 0.334, brightness: 0.696), width: 10)
                .padding(-5)
        }
        if value > 3 && value < 50 {
            
            Rectangle()
                .fill(Color(red:85 / 255 , green: 217 / 255 , blue:131 / 255))
                .frame(width:85, height: 85)
                .border(Color(hue: 0.452, saturation: 0.334, brightness: 0.696), width: 10)
                .padding(-5)
            
        }
        if value > 50 {
            
            Rectangle()
                .fill(Color(red:242 / 255 , green: 41 / 255 , blue:128 / 255))
                .frame(width:85, height: 85)
                .border(Color(hue: 0.452, saturation: 0.334, brightness: 0.696), width: 10)
                .padding(-5)
            
        }
       
    }
}

struct MiniRec_Previews: PreviewProvider {
    static var previews: some View {
        MiniRec(value: 2)
    }
}
