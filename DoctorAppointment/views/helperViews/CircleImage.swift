//
//  CircleImage.swift
//  DoctorAppointment
//
//  Created by Salihcan Kahya on 23.07.2020.
//  Copyright © 2020 Salihcan Kahya. All rights reserved.
//

import SwiftUI

struct CircleImage : View {
    @ObservedObject private var loader: ImageLoader
    let width,height : CGFloat
    init(url: URL,width : CGFloat, height : CGFloat) {
        loader = ImageLoader(url: url)
        self.width = width
        self.height = height
    }

    var body: some View {
        image
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }
    
    private var image: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable().clipShape(Circle())
                    .shadow(radius: 10)
            } else {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .shadow(radius: 10)
            }
        }.frame(width: width, height: height)
    }
}
