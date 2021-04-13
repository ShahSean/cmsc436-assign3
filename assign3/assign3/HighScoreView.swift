//
//  HighScoreView.swift
//  assign3
//
//  Created by Shahryar shagoshtasbi on 4/13/21.
//

import SwiftUI

struct HighScoreView: View {
    var body: some View {
        NavigationView{
            List{
                Text("Hi")
//                                Score(score: 5, time: Date.init());
            }.navigationTitle("High Scores")
            
        }
        //        Text("Hello From High Score View")
    }
}


struct Score: Hashable {
//    static func == (lhs: Score, rhs: Score) -> Bool {
//        lhs.score == rhs.score
//    }
    
    var score: Int
    var time: Date
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(time)
    }
    
    init(score: Int, time: Date) {
        self.score = score
        self.time = time
    }
}

class ScoreList {
    @Published var scoreList = 0
    
    init() {
        scoreList = [Score (score: 300, time: Date.init()), Score(score: 400, time: Date.init())]
    }
}


struct HighScoreView_Previews: PreviewProvider {
    static var previews: some View {
        HighScoreView()
    }
}
