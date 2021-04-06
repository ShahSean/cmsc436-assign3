//
//  RandOrDeter.swift
//  assign3
//
//  Created by Shahryar shagoshtasbi on 4/6/21.
//

import SwiftUI

struct RandOrDeter: View {
    @EnvironmentObject var logicObj : Triples
    
   
    @Binding var rand: Bool
    
    @State private var mode = ["Random", "Deterministic"]
    var body: some View {
        VStack {
            Picker("Select The Mode", selection: $rand){
                Text(self.mode[0]).tag(true)
                Text(self.mode[1]).tag(false)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .background(Color.orange)

            }
        }


//struct RandOrDeter_Previews: PreviewProvider {
//    static var previews: some View {
//        RandOrDeter()
//    }
//}
