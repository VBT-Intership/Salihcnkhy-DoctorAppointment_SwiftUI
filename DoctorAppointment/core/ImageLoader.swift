//
//  ImageLoader.swift
//  DoctorAppointment
//
//  Created by Salihcan Kahya on 23.07.2020.
//  Copyright © 2020 Salihcan Kahya. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL
    private var cancellable: AnyCancellable?
    
    deinit {
        cancellable?.cancel()
    }
    
    init(url: URL) {
        self.url = url
    }
    
    func load() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    func cancel() {cancellable?.cancel()}
}
