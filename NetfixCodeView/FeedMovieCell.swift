//
//  FeedMovieCell.swift
//  NetfixCodeView
//
//  Created by Cátia Souza on 04/06/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

import UIKit

class FeedMovieCell: UITableViewCell {
    
    var movies:[Movie]?{
        didSet{
            collectionMovieView.movies = movies
        }
    }
    var type: Bool!{
        didSet{
            collectionMovieView.type = type
        }
    }
    let collectionMovieView : CollectionMoviewView = {
        let cl = CollectionMoviewView()
        cl.collectionView.showsHorizontalScrollIndicator = false
        return cl
       
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews(){
        addSubview(collectionMovieView.collectionView)
        constraint(pattern: "H:|[v0]|", views: collectionMovieView.collectionView)
        constraint(pattern: "V:|[v0]|", views: collectionMovieView.collectionView)
        
    }
}
