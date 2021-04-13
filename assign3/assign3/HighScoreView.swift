//
//  HighScoreView.swift
//  assign3
//
//  Created by Shahryar shagoshtasbi on 4/13/21.
//

import SwiftUI

struct HighScoreView: View {
    @StateObject var scoreList = ScoreList()
    var body: some View {
        NavigationView{
            List(0..<scoreList.scoreList.count, id: \.self) { score in
                Text("score is  \(scoreList.scoreList[score])" as String)
            }
        }.navigationTitle("High Scores")
        
    }
    //        Text("Hello From High Score View")
}



struct Score: Hashable, Equatable {
    //    static func == (lhs: Score, rhs: Score) -> Bool {
    //        lhs.score == rhs.score
    //    }
    
    var score: Int
    var time: Date
//    var id: UUID
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(time)
    }
    
    init(score: Int, time: Date) {
        self.score = score
        self.time = time
//        self.id = UUID()
    }
}

class ScoreList: Identifiable, ObservableObject{
    @Published var scoreList = [Score]()
    
    init() {
        scoreList = [Score (score: 300, time: Date.init()), Score(score: 400, time: Date.init())]
    }
    func addNewScore(score: Score){
        scoreList.append(score)
        self.scoreList = scoreList.sorted{$0.score > $1.score}
    }
}


struct HighScoreView_Previews: PreviewProvider {
    static var previews: some View {
        HighScoreView()
    }
}
