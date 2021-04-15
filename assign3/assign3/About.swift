//
//  About.swift
//  assign3
//
//  Created by Shahryar shagoshtasbi on 4/13/21.
//

import SwiftUI

struct About: View {
    @State private var offset:CGFloat = 800.0
    @State private var btnClicked = false
    private var anim = Animation.easeIn(duration: 8.0).repeatForever(autoreverses: false)
    var body: some View {
        ZStack{
            Color(btnClicked ? .black : .white).ignoresSafeArea()
            Button("About Me"){
                btnClicked = true
                withAnimation{
                    self.offset += -2000
                }
            }
            .padding(20)
            .background(Color.blue.opacity(0.8))
            .foregroundColor(Color.white)
            .font(.title)
            .cornerRadius(8.0)
            .opacity( btnClicked ? 0 : 1)
            if btnClicked{
                Text("A long long time ago in a galaxy far, far away... \n \n Shahryar (Sean) Shagoshtabi.\n \n" +
                        " Made this game as a project for his IOS programming class. \n \n It was dark days and Sean was not sure if he can make it for the deadline of this project. \n \n But with the support of resistance (Dr. Google), Sean was able to make his best effort...")
                    
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
                    .multilineTextAlignment(.center)
                    .lineSpacing(11.0)
                    .padding(7)
                    .padding(.horizontal, 30)
                    .rotation3DEffect(
                        .degrees(40),
                        axis: (x: 1, y: 0, z: 0.0))
                    .shadow(color: .white, radius: 4, x:0 , y:5 )
                    .frame(width:340 , height: 1500)
                    .offset(x: 0.0, y: offset)
                    .animation(anim)
                    .onDisappear{
                        btnClicked = false
                        offset = 800
                    }
            }
        }
    }
    
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
