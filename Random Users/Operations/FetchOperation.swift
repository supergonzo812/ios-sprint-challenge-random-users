//
//  FetchOperation.swift
//  Random Users
//
//  Created by Chris Gonzales on 3/13/20.
//  Copyright © 2020 Erica Sadun. All rights reserved.
//

import Foundation

class FetchPhotoOperation: ConcurrentOperation {
    
    // MARK: - Properties
    
    var photoString: URL
    var imageData: Data?
    private var dataTask: URLSessionDataTask?
    
    // MARK: - Initializer
    
    init(photoString: URL) {
        self.photoString = photoString
    }
    
    // MARK: - Methods
    
    override func start() {
        state = .isExecuting
        
        dataTask = URLSession.shared.dataTask(with: photoString) { (data, _, error) in
            defer { self.state = .isFinished}
            if let error = error {
                           NSLog("Error loading image URL: \(error)")
                           return
                       }
                       guard let data = data else {
                           NSLog("No data returned")
                           return
                       }
                       self.imageData = data
        }
        guard let dataTask = dataTask else { return }
        dataTask.resume()
    }
    
    override func cancel() {
        guard let dataTask = dataTask else { return }
        dataTask.cancel()
    }
    
}
