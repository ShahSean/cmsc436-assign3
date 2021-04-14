//
//  GameView.swift
//  assign3
//
//  Created by Shahryar shagoshtasbi on 4/13/21.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var scoreList: ScoreList
    var body: some View {
    TabView {
            ContentView().tabItem {
                Label("Board", systemImage: "gamecontroller")
            }.environmentObject(scoreList)
            HighScoreView().tabItem {
                Label("Scores", systemImage: "list.dash")
            }.environmentObject(scoreList)
            About().tabItem {
                Label("About", systemImage: "info.circle")
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
