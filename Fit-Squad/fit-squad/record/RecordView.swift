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
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        return button
    }()
    
    lazy var routineTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .opaqueSeparator
        return tableView
    }()
    
    override func setupUI() {
        super.setupUI()
        backgroundColor = .white
        
        addSubview(startButton)

        startButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(100)
            make.left.equalTo(self.safeAreaLayoutGuide).inset(30)
            make.right.equalTo(self.safeAreaLayoutGuide).inset(30)
        }
        
        addSubview(routineTableView)
        
        routineTableView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(10)
            make.bottom.equalTo(startButton).inset(30)
            make.leading.equalTo(self.safeAreaLayoutGuide).inset(10)
            make.trailing.equalTo(self.safeAreaLayoutGuide)
        }
    }
}


