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
            
            Text("Hello \n This app is a class project done by Shahryar (Sean) Shagoshtabi.\n" +
                    " am from Iran, and I speak Farsi, English, and Dari. I got my high school diploma in 2011, and ever since then I have been studying in different universities and different majors such as Polymer Engineering, Accounting, and Computer Networks. I moved to the U.S in November 2016, and after settling, in January 2017, I started studying Computer Science at Montgomery College.")
                
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
                .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/(duration:5))
                .onDisappear{
                    offset = 800
                }
        }.onDisappear{
            btnClicked = false
//            offset = 800.00
        }
    }
 
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
