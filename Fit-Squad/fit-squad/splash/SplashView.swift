//
//  SplashView.swift
//  Fit-Squad
//
//  Created by 김동준 on 2022/02/03.
//

import Foundation
import UIKit
import SnapKit
import Then

class SplashView: BaseView{
    
    lazy var introLabel = UILabel().then{
        $0.textAlignment = .center
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 42)
        $0.text = "운동일기"
    }
    
    override func setupUI() {
        super.setupUI()
        backgroundColor = .white
        addSubview(introLabel)
     
        introLabel.snp.makeConstraints { make in
            make.center.equalTo(self)
        }
        
    }
    
}

