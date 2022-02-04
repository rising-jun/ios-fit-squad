//
//  HistoryView.swift
//  Fit-Squad
//
//  Created by 김동준 on 2022/02/03.
//

import Foundation
import UIKit
import Then

class HistoryView: BaseView{
    
    lazy var tableView: UITableView = UITableView().then{
        $0.separatorStyle = .none
    }
    
    override func setupUI() {
        super.setupUI()
        backgroundColor = .white
        addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self).offset(110)
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-20)
            make.height.equalTo(600)
        }
        
        
    }
    
}

