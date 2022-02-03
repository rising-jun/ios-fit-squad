//
//  SplashViewController.swift
//  Fit-Squad
//
//  Created by 김동준 on 2022/02/03.
//

import Foundation
import UIKit


class SplashViewController: BaseViewController{
    
    lazy var v = SplashView(frame: view.frame)
    
    lazy var vcArray: [BaseViewController] = [HistoryViewController()]
    lazy var vcTitle: [String] = ["운동기록"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view = v
        startTimer()
        
    }
    
}

extension SplashViewController{
    
    func startTimer(){
        DispatchQueue.main.async {
            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { [weak self] timer in
                guard let self = self else { return }
                self.present(self.makeTabBarVC(), animated: true, completion: nil)
            }
        }
    }
    
    private func makeTabBarVC() -> UITabBarController{
        let tabBarVC = UITabBarController()
        for i in 0 ..< self.vcArray.count{
            tabBarVC.addChild(self.vcArray[i])
            self.vcArray[i].tabBarItem = UITabBarItem(title: self.vcTitle[i], image: UIImage(), tag: i)
        }
        tabBarVC.modalPresentationStyle = .fullScreen
        return tabBarVC
    }
    
    
}
