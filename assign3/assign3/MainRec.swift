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
                        TileView(tile: Tile(val: array[index].val, id: UUID(), row: 2, col: 4))
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
