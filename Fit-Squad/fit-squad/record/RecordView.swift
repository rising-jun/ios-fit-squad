//
//  RecordView.swift
//  Fit-Squad
//
//  Created by Bumgeun Song on 2022/02/03.
//

import Foundation
import UIKit
import SnapKit

class RecordView: BaseView {
    
    lazy var startButton: UIButton = {
        var button = UIButton()
        button.setTitle("운동 추가", for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()
    
    
    override func setupUI() {
        super.setupUI()
        backgroundColor = .white
        
        addSubview(startButton)
        
        startButton.backgroundColor = .systemBlue
        
        startButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(100)
            make.left.equalTo(self.safeAreaLayoutGuide).inset(30)
            make.right.equalTo(self.safeAreaLayoutGuide).inset(30)
        }
    }
}


