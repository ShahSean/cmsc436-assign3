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
        VStack{
            ForEach(logicObj.board, id:\.self){ array in
                HStack{
                    ForEach(0..<array.endIndex , id: \.self){ index in
//                        Text("bye \(index)")
//                        ZStack{

                        TileView(tile: Tile(val: array[index].val, id: UUID(), row: 2, col: 4))

//                            // Just passing the value down to decide on the Color in MiniRec
//                            MiniRec(value:array[index])
//                            if array[index] != 0{
//                                Text(String(array[index]))
//                                .foregroundColor(.white)
//                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                                .font(.system(size: 28))
//                            }
//                        }
                    }
                }

            }
        }
    }
}




struct MainRec_Previews: PreviewProvider {
    static var previews: some View {
        MainRec().environmentObject(Triples())
    }
}
