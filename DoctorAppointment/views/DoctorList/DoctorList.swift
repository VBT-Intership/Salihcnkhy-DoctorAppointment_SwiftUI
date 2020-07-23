//
//  DoctorList.swift
//  DoctorAppointment
//
//  Created by Salihcan Kahya on 23.07.2020.
//  Copyright © 2020 Salihcan Kahya. All rights reserved.
//

import SwiftUI

struct DoctorList: View {
    
    @Binding var doctors : [Doctor]
    var body: some View {
            List(doctors , id: \.id){ doc in
                DoctorRow(doctor : doc).frame(height : 200)
            }.navigationBarBackButtonHidden(true).navigationBarTitle("Doctor List",displayMode: .inline)
        // There's a bug when displayMode large
    }
}

