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
    
    override func setupUI() {
        super.setupUI()
        backgroundColor = .white
        
        
        
    }
    
}

extension HistoryView{
    
    final func setNavigationBarIconView() -> UIBarButtonItem{
        let iconView = UIView()
        let iconImageView = UIImageView().then{
            $0.contentMode = .scaleAspectFit
            $0.image = UIImage(named: "exercise")
        }
        let iconLabel = UILabel().then{
            $0.text = "FitSquad"
            $0.font = UIFont.boldSystemFont(ofSize: 28)
            $0.textColor = .orange
        }
        
        iconView.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
        
        iconView.addSubview(iconImageView)
        iconView.addSubview(iconLabel)
        
        iconImageView.snp.makeConstraints { (make) in
            make.width.equalTo(25)
            make.height.equalTo(25)
            make.centerY.equalTo(iconView)
        }

        
        iconLabel.snp.makeConstraints { (make) in
            make.width.equalTo(120)
            make.height.equalTo(40)
            make.centerY.equalTo(iconView)
            make.leading.equalTo(iconImageView.snp.trailing).offset(5)
        }
        
        return UIBarButtonItem(customView: iconView)
    }
    
}
