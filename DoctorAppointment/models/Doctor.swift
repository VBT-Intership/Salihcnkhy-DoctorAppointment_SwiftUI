//
//  Doctor.swift
//  DoctorAppointment
//
//  Created by Salihcan Kahya on 23.07.2020.
//  Copyright © 2020 Salihcan Kahya. All rights reserved.
import Foundation

// MARK: - DoctorElement
struct Doctor: Codable{
    let id = UUID()
    let about: String
    let communication: Communication
    let experience: Int
    let field, name: String
    let patients: Int
    let photo: String
    let ratings: Double
    let workingday, workingtime: Working
}

// MARK: - Communication
struct Communication: Codable {
    let audiocall, messaging, videocall: String
}

// MARK: - Working
struct Working: Codable {
    let from, to: String
}

