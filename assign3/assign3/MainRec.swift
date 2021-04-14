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
                            .animation(.easeInOut(duration: 1))
                }
        }.offset(CGSize(width: -130, height: -5))
    }
}




struct MainRec_Previews: PreviewProvider {
    static var previews: some View {
        MainRec().environmentObject(Triples())
    }
}
