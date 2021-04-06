//
//  Score Label.swift
//  assign3
//
//  Created by Shahryar shagoshtasbi on 4/6/21.
//

import SwiftUI

struct Score_Label: View {
    @EnvironmentObject var logicObj : Triples
    var body: some View {
        HStack{
            
            Text("Score is: ").font(.system(size: 29)).italic()

            Text("\(logicObj.score)").font(.system(size: 39)).italic().bold()
        }
    }
    
    
}

struct Score_Label_Previews: PreviewProvider {
    static var previews: some View {
        Score_Label().environmentObject(Triples())
    }
}
