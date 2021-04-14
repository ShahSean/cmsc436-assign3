//
//  HighScoreView.swift
//  assign3
//
//  Created by Shahryar shagoshtasbi on 4/13/21.
//

import SwiftUI

struct HighScoreView: View {
    @StateObject var scoreList = ScoreList()
    let dateFormatter = DateFormatter()
    
    init(){
    createDateFormatter()
        
    }
    var body: some View {
        NavigationView{
            List(0..<scoreList.scoreList.count, id: \.self) { score in
                Text("\(score + 1) )" as String)
                Spacer()
                Text("\(scoreList.scoreList[score].score)" as String)
                Spacer()
                Text("\(dateFormatter.string(from: scoreList.scoreList[score].time))" as String)
            }.navigationTitle("Highest Scores")
        }
    }
    
    func createDateFormatter (){
        dateFormatter.dateFormat = "HH: mm: ss, d MMM y"
    }
}


struct Score: Hashable{
    
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
