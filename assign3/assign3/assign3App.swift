//
//  assign3App.swift
//  assign3
//
//  Created by Shahryar shagoshtasbi on 4/6/21.
//

import SwiftUI

@main
struct assign3App: App {
    @StateObject var scoreList = ScoreList()
    var body: some Scene {
        WindowGroup {
            GameView().environmentObject(scoreList)
        }
    }
}
