//
//  ViewController.swift
//  NetfixCodeView
//
//  Created by Cátia Souza on 03/06/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let cellId = "cellId"
    var feedMovie : FeedMovie?
    
    let  progressView: UIActivityIndicatorView = {
    let p = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    p.backgroundColor = .black
    p.translatesAutoresizingMaskIntoConstraints = false
    p.startAnimating()
    return p
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // setupIndicatorView()
        setupViews()
        
        let api = NetflixAPI.shared
        api.delegate = self
        api.request()
    }
    private func setupViews(){
        // navigationView
        let logo = UIImageView(frame: CGRect(x: 0, y: 0, width:( navigationController?.navigationBar.frame.width)!, height: ( navigationController?.navigationBar.frame.height)! * 0.65))
        logo.image = UIImage(named: "logo-splash")
        logo.contentMode = .scaleAspectFit
        navigationItem.titleView = logo
        navigationController?.navigationBar.barTintColor = UIColor.fromExvalue(value: 0x111111, alpha: 0.5)
        navigationController?.navigationBar.isTranslucent = true
        
        //table view
        tableView.register(FeedMovieCell.self, forCellReuseIdentifier: cellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.backgroundColor = UIColor.fromExvalue(value: 0x222222)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
    }

    func setupIndicatorView(){
        guard let window =  UIApplication.shared.keyWindow else {return}
        window.addSubview(progressView)
        window.bringSubviewToFront(progressView)
        
        window.constraint(pattern: "H:|[v0]|", views: progressView)
        window.constraint(pattern: "V:|[v0]|", views: progressView)

        
        var constraints = [NSLayoutConstraint]()
        constraints.append(NSLayoutConstraint(item: progressView
            , attribute: .centerX,
              relatedBy: .equal,
              toItem: window,
              attribute: .centerX,
              multiplier: 1,
              constant: 1))
        
        constraints.append(NSLayoutConstraint(item: progressView
                   , attribute: .centerY,
                     relatedBy: .equal,
                     toItem: window,
                     attribute: .centerY,
                     multiplier: 1,
                     constant: 1))
        
        NSLayoutConstraint.activate(constraints)
    }
    func setupHeaderView(movie: Movie){
        let width = tableView.frame.width
        let header = UIView(frame: CGRect(x: 0, y: 0, width: width, height: width * (9 / 16) + 32))
        
        let iv = UIImageView()
        iv.image = UIImage(named: movie.imgUrl)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .red
        header.addSubview(iv)
        
        let label = UILabel()
        label.text = movie.title
        label.textColor = .white
        label.backgroundColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        header.addSubview(label)
        
        header.constraint(pattern: "H:|[v0]|", views: iv)
        header.constraint(pattern: "H:|[v0]|", views: label)
        header.constraint(pattern: "V:|[v0][v1(32)]-10-|", views: iv,label)
        tableView.tableHeaderView = header
    }
}
extension ViewController: FeedMovieDelegate{
    func response(status: Int, feed: FeedMovie) {
        progressView.removeFromSuperview()
        if status == 200 {
            self.feedMovie = feed
            self.setupHeaderView(movie: feed.highlight)
            tableView?.reloadData()
    }
    }
}


extension ViewController{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return feedMovie?.movie.keys.count ?? 0
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
        headerView.backgroundColor = UIColor.fromExvalue(value: 0x222222)
        if let movieDict = feedMovie?.movie{
            let label = UILabel(frame: .zero)
            label.text = movieDict[section]?.0 //Array(movieDict.keys)[section]
            label.textColor = .white
            label.font = UIFont.boldSystemFont(ofSize: 14)
            label.translatesAutoresizingMaskIntoConstraints = false
            
            headerView.addSubview(label)
            var constraints = [NSLayoutConstraint]()
            constraints.append(NSLayoutConstraint(item: label,
                                                  attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: headerView,
                                                  attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1,
                                                  constant: -4))
            
            constraints.append(NSLayoutConstraint(item: label,
                                                  attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: headerView,
            attribute: NSLayoutConstraint.Attribute.left, multiplier: 1,
            constant: 8))
            NSLayoutConstraint.activate(constraints)
           
        }
         return headerView
    }
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if let movie = feedMovie?.movie{
//            return Array(movie.keys)[section]
//        }
//        return nil
//    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let width : CGFloat = tableView.frame.width * 0.6
        return  width * (3 / 4)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cel =  tableView.dequeueReusableCell(withIdentifier: cellId) as! FeedMovieCell
        if let m = feedMovie?.movie{
            //let key = Array(m.keys)[indexPath.section]
            let movies = m[indexPath.section]?.1
            cel.movies = movies
        }
        cel.backgroundColor = .brown
        cel.type = indexPath.section == 0
        return cel
    }
}
