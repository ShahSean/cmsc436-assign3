//
//  GameView.swift
//  assign3
//
//  Created by Shahryar shagoshtasbi on 4/13/21.
//

import SwiftUI

struct GameView: View {
    var body: some View {
    TabView {
            ContentView().tabItem {
                Label("Board", systemImage: "gamecontroller")
            }
            HighScoreView().tabItem {
                Label("Scores", systemImage: "list.dash")
            }
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
