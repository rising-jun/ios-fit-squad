//
//  BaseView.swift
//  Fit-Squad
//
//  Created by 김동준 on 2022/01/31.
//

import Foundation
import UIKit

class BaseView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI(){
        
    }
    
    
}
