//
//  About.swift
//  assign3
//
//  Created by Shahryar shagoshtasbi on 4/13/21.
//

import SwiftUI

struct About: View {
    @State private var degrees = 0.0
    @State private var offset:CGFloat = 430.0
    @State private var backColor = white
    var body: some View {
        ZStack{
            Color(backColor)
            Button("About Me"){
                withAnimation{
                    self.offset += -1000
                }

            }
            .padding(20)
            .background(Color.blue.opacity(0.8))
            .foregroundColor(Color.white)
            .font(.title)
            .cornerRadius(8.0)
//            .rotation3DEffect(.degrees(degrees), axis: (x: 1, y: 1, z: 1))
            
            
            //        Text("Hello \n This app is class project done by Shahryar (Sean) Shagoshtabi.\n" +
            //            " am from Iran, and I speak Farsi, English, and Dari. I got my high school diploma in 2011, and ever since then I have been studying in different universities and different majors such as Polymer Engineering, Accounting, and Computer Networks. I moved to the U.S in November 2016, and after settling, in January 2017, I started studying Computer Science at Montgomery College.")
            Text("Hello")
                .frame(width:150 , height: 300)
                .offset(x: 0.0, y: offset)
                .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/(duration:9))
//                .font(.title)
//                .fontWeight(.bold)
//                .foregroundColor(.yellow)
//                .multilineTextAlignment(.center)
//                .lineSpacing(10.0)
//                .padding(5)
//                .padding(.horizontal, 30)
//                .rotation3DEffect(
//                    .degrees(60),
//                    axis: (x: 1, y: 0, z: 0.0))
//                .shadow(color: .gray,  radius: 2, x:0 , y:5 )
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
