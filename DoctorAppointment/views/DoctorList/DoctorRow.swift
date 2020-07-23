//
//  DoctorRow.swift
//  DoctorAppointment
//
//  Created by Salihcan Kahya on 23.07.2020.
//  Copyright © 2020 Salihcan Kahya. All rights reserved.
//

import SwiftUI
import Combine

struct DoctorRow: View {
    var doctor : Doctor
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                RoundedRectangle(cornerRadius: 5).fill(Color.white).shadow(radius: 4)
                HStack(spacing: 30){
                    CircleImage(url: URL(string: self.doctor.photo)!,width: geo.size.width * 0.35, height: geo.size.width * 0.35)
                    VStack(spacing: 15){
                        Text(self.doctor.name)
                        DoctorSpecRow(doctor: self.doctor)
                    }
                }.padding(20)
            }
        }
    }
}

