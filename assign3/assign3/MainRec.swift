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

            ForEach(logicObj.board.reduce([], +), id:\.id){ tile in
                        TileView(tile: tile)
                            .offset(CGSize(width: 85 * tile.col , height: 85 * tile.row))
                            .animation(.easeInOut(duration: 1))
                }
        }.offset(CGSize(width: -130, height: -130))
        .frame(width: 85 * 4, height: 85 * 4)
    }
}




struct MainRec_Previews: PreviewProvider {
    static var previews: some View {
        MainRec().environmentObject(Triples())
    }
}
