//
//  MainRec.swift
//  assign3
//
//  Created by Shahryar shagoshtasbi on 4/6/21.
//

import SwiftUI

struct MainRec: View {
    @EnvironmentObject var logicObj : Triples
    
    var body: some View {
        ZStack{
//        VStack{
            ForEach(logicObj.board, id:\.self){ array in
//                HStack{
                ForEach(0..<array.endIndex , id: \.self){ index in
                        TileView(tile: array[index])
                            .offset(CGSize(width: 85 * array[index].col , height: 85 * array[index].row))
                            .animation(.easeInOut(duration: 2))
                    }
                }
        }.offset(CGSize(width: -100, height: -80))
//            }
//        }
    }
}




struct MainRec_Previews: PreviewProvider {
    static var previews: some View {
        MainRec().environmentObject(Triples())
    }
}
