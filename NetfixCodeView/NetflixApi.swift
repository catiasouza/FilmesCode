//
//  NetflixApi.swift
//  NetfixCodeView
//
//  Created by Cátia Souza on 03/06/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

import UIKit

protocol FeedMovieDelegate {
    func response(status: Int, feed: FeedMovie)
}
class NetflixAPI: NSObject{
    
    static let shared = NetflixAPI()
    var delegate : FeedMovieDelegate!
    
    func request() {
        let delay = DispatchTime.now() + .seconds(3)
        DispatchQueue.main.asyncAfter(deadline: delay) {
            self.delegate.response(status: 200, feed: FeedMovie())
        }
    }
}

