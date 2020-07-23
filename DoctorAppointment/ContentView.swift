//
//  ContentView.swift
//  DoctorAppointment
//
//  Created by Salihcan Kahya on 23.07.2020.
//  Copyright © 2020 Salihcan Kahya. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    
    @State var hasError = false
    @State var pushDoctorList = false
    @State var doctors : [Doctor] = []
    var url = "https://realtimedemoapp-3accc.firebaseio.com/doctors.json"
    
    var body: some View {
        NavigationView{
            GeometryReader { geo in
                VStack{
                    CircleProgressView().frame(width: geo.size.width/2, height: geo.size.width/2).overlay(Text("Doctors are loading...").font(.callout))
                    if self.hasError{
                        Text("Error Occured")
                    }
                    if self.pushDoctorList {
                        
                        NavigationLink(destination: DoctorList(doctors: self.$doctors), isActive: self.$pushDoctorList) {
                            EmptyView()
                        }
                    }
                }
            }
        }
        .onAppear{
            UITableView.appearance().separatorStyle = .none
            
            self.handleCallback()
        }
    }
    
    func handleCallback(){
        HttpTask().GetRequest(url: url){
            doctors in
            if let docs = doctors{
                self.doctors = docs
                self.pushDoctorList = true
            }else {
                self.hasError = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
