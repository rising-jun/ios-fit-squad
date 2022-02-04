//
//  RoutineViewController.swift
//  Fit-Squad
//
//  Created by 김동준 on 2022/02/03.
//

import Foundation
import UIKit
import SnapKit
import Then

class RoutineViewController: BaseViewController {
    lazy var v = RoutineView(frame: view.frame)
    
    //화면 터치시 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = v
        // Do any additional setup after loading the view.
    }
}
