//
//  ContentView.swift
//  Swift UI Intro
//
//  Created by User 1 on 8/1/21.
//

import SwiftUI

struct ContentView: View {
    var colors = ["Blue","Green","Red"]
    var body: some View {
        VStack
        {
            List
            {
                ForEach(colors, id: \.self)
                {color in
                    Text(color)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
