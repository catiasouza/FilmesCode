//
//  SceneDelegate.swift
//  NetfixCodeView
//
//  Created by Cátia Souza on 03/06/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let feedVc = ViewController(style: UITableView.Style.grouped)
        let nav = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = nav
        window?.windowScene = scene
        window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}
extension UIColor{
  static  func fromExvalue(value: UInt32) -> UIColor{
        let r = CGFloat((value & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((value & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(value & 0x0000FF)  / 255.0
        let a = CGFloat(1.0)
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    static  func fromExvalue(value: UInt32, alpha: CGFloat) -> UIColor{
           let r = CGFloat((value & 0xFF0000) >> 16) / 255.0
           let g = CGFloat((value & 0x00FF00) >> 8) / 255.0
           let b = CGFloat(value & 0x0000FF)  / 255.0
           let a = alpha
           return UIColor(red: r, green: g, blue: b, alpha: a)
       }
}
extension UIView{
    func constraint(pattern: String, views: UIView...){
        var myViews: [String: UIView] = [:]
        for (index, view)in views.enumerated(){
            view.translatesAutoresizingMaskIntoConstraints = false
            myViews["v\(index)"] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: pattern,
                                                      options: NSLayoutConstraint.FormatOptions(), metrics: nil,
                                                      views: myViews))
    }
}
