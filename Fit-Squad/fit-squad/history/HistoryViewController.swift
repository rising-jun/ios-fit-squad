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
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        view = v
        print("commit test")
    }
    
    
}
