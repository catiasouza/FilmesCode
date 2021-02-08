//
//  MovieCell.swift
//  NetfixCodeView
//
//  Created by Cátia Souza on 04/06/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    var movie: Movie?{
        didSet{
            titleLabel.text = movie?.title
            if let url = movie?.imgUrl{
                img.image = UIImage(named: url)
            }
            
        }
    }
    let img : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Catia"
        return lbl
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews(){
        addSubview(img)
        constraint(pattern: "H:|[v0]|", views: img)
        constraint(pattern: "V:|[v0]|", views: img) // construindo a colection
    }
}
