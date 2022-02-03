//
//  HistoryViewController.swift
//  Fit-Squad
//
//  Created by 김동준 on 2022/02/03.
//

import Foundation
import UIKit

class HistoryViewController: BaseViewController{
    
    lazy var v = HistoryView(frame: view.frame)
    private let writeButton = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        view = v
        writeButton.title = "작성하기"
        self.tabBarController!.navigationItem.setRightBarButton(self.writeButton, animated: false)
        self.tabBarController!.navigationItem.hidesBackButton = true
        self.tabBarController?.navigationItem.leftBarButtonItem = self.v.setNavigationBarIconView()
    }
    
    
}
