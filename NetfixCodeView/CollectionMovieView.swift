//
//  CollectionMovieView.swift
//  NetfixCodeView
//
//  Created by Cátia Souza on 04/06/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

import UIKit

class CollectionMoviewView: NSObject, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
   
    let collectionId = "collectionId"
    let collectionMovie = "collectionMovie"
    var movies: [Movie]?
    var type: Bool = false{
        didSet{
            collectionView.reloadData()
        }
    }
    
    lazy var  collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cl = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cl.backgroundColor = UIColor.fromExvalue(value: 0x222222)
        
        cl.delegate = self
        cl.dataSource = self
        return cl
    }()
    override init() {
        super.init()
        collectionView.register(MovieContinueCell.self, forCellWithReuseIdentifier: collectionId)
         collectionView.register(MovieCell.self, forCellWithReuseIdentifier: collectionMovie)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if type{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionId, for: indexPath) as! MovieContinueCell
            
            cell.backgroundColor = UIColor.fromExvalue(value: 0x313131)
            cell.movie = movies![indexPath.row]
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionMovie, for: indexPath) as! MovieCell
            
            cell.backgroundColor = UIColor.fromExvalue(value: 0x313131)
            cell.movie = movies![indexPath.row]
            return cell
        }
     
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if type{
            let width : CGFloat = collectionView.frame.width * 0.6
            return CGSize(width: width, height: width * (3 / 4))
        }else{
            let width : CGFloat = collectionView.frame.width * 0.29
            return CGSize(width: width, height: width * (16 / 9))
        }
      
    }
}
