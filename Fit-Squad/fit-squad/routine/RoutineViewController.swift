//
//  RoutineViewController.swift
//  Fit-Squad
//
//  Created by 김동준 on 2022/02/03.
//

import Foundation
import UIKit

class RoutineViewController: BaseViewController {
    lazy var v = RoutineView(frame: view.frame)
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = v
    }
}
