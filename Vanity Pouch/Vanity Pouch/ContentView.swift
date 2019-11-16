//
//  ContentView.swift
//  Vanity Pouch
//
//  Created by Ayesha Khan on 11/15/19.
//  Copyright © 2019 Ayesha Khan. All rights reserved.
//

import SwiftUI

struct Box {
    var id: Int
    let title, imageUrl : String
}

struct BoxView: View {
    let box: Box
    
    var body: some View {
        Image(box.imageUrl)
            .resizable().cornerRadius(10)
            .frame(width: 262, height: 274).shadow(radius: 3)
    }
}

struct ContentView: View {
    
    let cardBoxes: [Box] = [
        Box(id: 0, title: "Foundation", imageUrl: "Foundation"),
        Box(id: 1, title: "Eyeliner", imageUrl: "Eyeliner"),
        Box(id: 2, title: "Eyeshadow Palette", imageUrl: "EyeshadowPalette"),
        Box(id: 3, title: "Lipstick", imageUrl: "Lipstick"),
        Box(id: 4, title: "Mascara", imageUrl: "Mascara")
    ]
    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators: false)  {
                HStack {
                    ForEach(cardBoxes, id:\.id) { box in GeometryReader { geometry in
                            BoxView(box: box).rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX) / -20), axis: (x: 0, y: 10.0, z: 0))
                        }.frame(width: 262, height: 500)
                }
            }
        }.padding(20)
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
