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
        Text(tile.val.description)
    }
}


struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        TileView(tile: Tile(val: 5, id: <#T##UUID#>.uuid, row: <#T##Int#>, col: <#T##Int#>))
    }
}
