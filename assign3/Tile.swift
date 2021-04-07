//
//  Tile.swift
//  assign3
//
//  Created by Shahryar shagoshtasbi on 4/6/21.
//

import Foundation


struct Tile:  Hashable, Identifiable {
//    var id: ObjectIdentifier
    
    var val : Int
    public var id = UUID()
    var row: Int    // recommended
    var col: Int
    
    init(val:Int, id:UUID , row:Int, col: Int) {
        self.val = val
        self.id = id
        self.row = row
        self.col = col
    }
 
}
