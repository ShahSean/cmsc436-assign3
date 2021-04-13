//
//  TileView.swift
//  assign3
//
//  Created by Shahryar shagoshtasbi on 4/12/21.
//

import SwiftUI


struct TileView: View {
    var tile = Tile(val: 0, id: UUID(), row: 0, col: 0)
    
    
    init(tile: Tile) {
        self.tile = tile
        
    }
    
    var body: some View {
        ZStack{
            MiniRec(value: tile.val)
            if tile.val != 0{
                Text(String(tile.val.description))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 28))
            }
        }
    }
}


struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        TileView(tile: Tile(val: 5, id: UUID() , row: 2, col: 3))
    }
}
