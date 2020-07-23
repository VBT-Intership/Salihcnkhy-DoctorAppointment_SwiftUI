//
//  DoctorSpecRow.swift
//  DoctorAppointment
//
//  Created by Salihcan Kahya on 23.07.2020.
//  Copyright © 2020 Salihcan Kahya. All rights reserved.
//

import SwiftUI

struct DoctorSpecRow: View {
    var doctor : Doctor
    var body: some View {
        HStack{
             DoctorSpecCard(image:  Image(systemName: "person.crop.circle"), imageColor: Color.blue, boxColor: Color.blue.opacity(0.4), specText: "Patients", specCount: patientsCountLogic())
            
             DoctorSpecCard(image:  Image(systemName: "person.crop.circle"), imageColor: Color.blue, boxColor: Color.blue.opacity(0.4), specText: "Patients", specCount: patientsCountLogic())
            
             DoctorSpecCard(image:  Image(systemName: "person.crop.circle"), imageColor: Color.blue, boxColor: Color.blue.opacity(0.4), specText: "Patients", specCount: patientsCountLogic())
        }

    }
    func patientsCountLogic() -> String {
        return doctor.patients > 1000 ? "1000+" : String(doctor.patients)
    }
}

struct DoctorSpecCard: View {
    
    var image : Image
    var imageColor : Color
    var boxColor : Color
    var specText : String
    var specCount : String

    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15).fill(Color.green).shadow(color: Color.black.opacity(0.2), radius: 5, x: 2, y: 2)
            GeometryReader{ geo in
                VStack(alignment : .center){
                    ZStack{
                        RoundedCorner(radius: 15, corners: [.bottomLeft,.bottomRight]).fill(self.boxColor)
                        GeometryReader{ geo in
                            self.image.resizable().frame(width: self.calculateIconSize(geo: geo), height: self.calculateIconSize(geo: geo)).foregroundColor(self.imageColor)
                        }
                        }.frame(width : geo.size.width * 0.5)
                    Spacer()
                    Text(self.specCount).scaledToFit().font(.system(size: 16, weight: .bold, design: .default)).foregroundColor(Color.black.opacity(0.8)).minimumScaleFactor(0.75).lineLimit(1)
                    Text(self.specText).scaledToFit().font(.system(size: 10, weight: .bold, design: .default)).foregroundColor(Color.gray).minimumScaleFactor(0.75).lineLimit(1)
                    Spacer()
                }
                
                
            }
        }
        
    }
    func calculateIconSize(geo : GeometryProxy) -> CGFloat {
        return geo.size.width > geo.size.height ? geo.size.width * 0.2 : geo.size.height * 0.2
    }
}

