//
//  MovieContinueCell.swift
//  NetfixCodeView
//
//  Created by Cátia Souza on 04/06/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

import UIKit

extension UIView {
    func addGradient(colors: [UIColor], locations: [NSNumber]){
        addSubview(ViewWithGradient(addTo: self, colors: colors, locations: locations))
    }
}
class ViewWithGradient : UIView {
    private var gradient = CAGradientLayer()
    init(addTo parentView: UIView, colors: [UIColor], locations:[NSNumber]){
        super.init(frame: CGRect(x: 0, y: 0, width: 1, height: 12))
        restorationIdentifier = "__ViewWithGradient"
        
        for subView in parentView.subviews{
            if let subView = subView as? ViewWithGradient{
                if subView.restorationIdentifier == restorationIdentifier{
                    subView.removeFromSuperview()
                    break
                }
            }
        }
      
        let cgColors = colors.map { (color) -> CGColor in
            return color.cgColor
        }
        gradient.frame = parentView.frame
        gradient.colors = cgColors
        gradient.locations = locations
        backgroundColor = .clear
        
        parentView.addSubview(self)
        parentView.layer.insertSublayer(gradient, at: 0)
        parentView.backgroundColor = .clear
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        clipsToBounds = true
        parentView.layer.masksToBounds = true
        
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews(){
        super.layoutSubviews()
        if let parentView = superview{
            gradient.frame = parentView.bounds
        }
}
    override func removeFromSuperview() {
        super.removeFromSuperview()
        gradient.removeFromSuperlayer()
    }
}
class MovieContinueCell: UICollectionViewCell {
    
    var movie: Movie?{
        didSet{
           // titleLabel.text = movie?.title   original
            if let movie = movie{
                titleLabel.text = movie.title
                descLabel.text = movie.description
                coverImg.image = UIImage(named: movie.imgUrl)
                
                let value: Float = 0.8
                Timer.scheduledTimer(withTimeInterval: 0, repeats: false, block: { (timer) in
                    self.progress.setProgress(value, animated: true)
                })
                self.overlayShadow.addGradient(colors: [.clear,.black],locations:[0.1, 0.8])
            }
            }
        }
    let progress:UIProgressView = {
        let p = UIProgressView(progressViewStyle: .default)
        p.progressTintColor = .red
        p.progress = 0
        p.layer.cornerRadius = 2
        p.layer.masksToBounds = true
        p.trackTintColor = UIColor.fromExvalue(value: 0x2222222)
        return p
    }()
    let coverImg:UIImageView = {     // cobre toda tela de fundo do quadrado
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
        
    }()
    let overlayShadow:UIView = {
        let v = UIView()
        return v
    }()
    let overlay : UIImageView = {  // imagem do meio de continue
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "overlay")
        return iv
    }()
    let titleLabel: UILabel = {  // descricao
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        return lbl
    }()
    let descLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 14)
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

        addSubview(coverImg)
        addSubview(overlay)
        addSubview(titleLabel)
        addSubview(descLabel)
        addSubview(progress)
        addSubview(overlayShadow)
        
        constraint(pattern: "H:|[v0]|", views: coverImg)
        constraint(pattern: "V:[v0(\(self.frame.width * (9 / 16)))]", views: coverImg)
        
        constraint(pattern: "H:|[v0]|", views: overlayShadow)
        constraint(pattern: "V:|[v0]|", views: overlayShadow)
        
        constraint(pattern: "H:|[v0(48)]|", views: overlay)
        constraint(pattern: "V:|[v0(48)]|", views: overlay)
        
        constraint(pattern: "H:|-12-[v0]|", views: titleLabel)
        constraint(pattern: "H:|-12-[v0]|", views: descLabel)
        
        constraint(pattern: "H:|-8-[v0]-8-|", views: progress)
        constraint(pattern: "V:[v0(2)]-6-[v1][v2]-8-|", views: progress, titleLabel, descLabel)
        
        self.bringSubviewToFront(titleLabel)
        self.bringSubviewToFront(descLabel)
        self.bringSubviewToFront(progress)
        self.bringSubviewToFront(overlay)
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(NSLayoutConstraint(item: self,
                                              attribute: NSLayoutConstraint.Attribute.centerY,
                                              relatedBy: NSLayoutConstraint.Relation.equal,
                                              toItem: overlay,
                                              attribute: NSLayoutConstraint.Attribute.centerY,
                                              multiplier: 1,
                                              constant: (self.frame.height - (self.frame.width * (9 / 16))) / 2))
        constraints.append(NSLayoutConstraint(item: self,
                                                     attribute: NSLayoutConstraint.Attribute.centerX,
                                                     relatedBy: NSLayoutConstraint.Relation.equal,
                                                     toItem: overlay,
                                                     attribute: NSLayoutConstraint.Attribute.centerX,
                                                     multiplier: 1,
                                                     constant: 0))
        NSLayoutConstraint.activate(constraints)
    }
}

