//
//  HistoryCell.swift
//  Fit-Squad
//
//  Created by 김동준 on 2022/02/03.
//

import Foundation
import UIKit
import Then

class HistoryCell: UITableViewCell{
    
    lazy var view = UIView()
    private var routine: RoutineInfo!
    
    lazy var nameLabelArr: [UILabel] = []
    lazy var repsLabelArr: [UILabel] = []
    lazy var setLabelArr: [UILabel] = []
    lazy var kgLabelArr: [UILabel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.addSubview(view)
        
        view.backgroundColor = .yellow
        view.snp.makeConstraints { make in
            make.width.equalTo(self)
            make.height.equalTo(50 + (40 * routine.exercises.count))
        }
        
        addCells(view: view)
        
    }
    
}

extension HistoryCell{
    func setRoutinArr(_ value: RoutineInfo){
        self.routine = value
    }
    
    func addCells(view: UIView){
        for i in 0 ..< self.routine.exercises.count{
            lazy var nameLabel: UILabel = UILabel().then{
                $0.textAlignment = .center
                $0.font = UIFont.boldSystemFont(ofSize: 20)
                $0.text = "exercise"
            }
            
            lazy var repsLabel: UILabel = UILabel().then{
                $0.textAlignment = .center
                $0.font = UIFont.boldSystemFont(ofSize: 20)
                $0.text = "13Re"
            }
            
            lazy var setLabel: UILabel = UILabel().then{
                $0.textAlignment = .center
                $0.font = UIFont.boldSystemFont(ofSize: 20)
                $0.text = "10set"
            }
            
            lazy var kgLabel: UILabel = UILabel().then{
                $0.textAlignment = .center
                $0.font = UIFont.boldSystemFont(ofSize: 20)
                $0.text = "100kg"
            }
            
            nameLabelArr.append(nameLabel)
            repsLabelArr.append(repsLabel)
            setLabelArr.append(setLabel)

            nameLabel.text = "\(routine.exercises[i].name)"
            
            view.addSubview(nameLabel)
            view.addSubview(repsLabel)
            view.addSubview(setLabel)
            view.addSubview(kgLabel)
            if i == 0{
                lazy var dateLabel: UILabel = UILabel().then{
                    $0.textAlignment = .center
                    $0.font = UIFont.boldSystemFont(ofSize: 24)
                    $0.text = "date label"
                }
                
                view.addSubview(dateLabel)
                
                dateLabel.snp.makeConstraints { make in
                    make.top.equalTo(self).offset(5)
                    make.width.equalTo(150)
                    make.height.equalTo(30)
                    make.leading.equalTo(self.snp.leading)
                }
                
                nameLabel.backgroundColor = .yellow
                nameLabel.snp.makeConstraints { make in
                    make.top.equalTo(dateLabel.snp.bottom).offset(10)
                    make.width.equalTo(150)
                    make.height.equalTo(30)
                    make.leading.equalTo(self)
                }
                
                
                repsLabel.snp.makeConstraints { make in
                    make.top.equalTo(nameLabel)
                    make.width.equalTo(70)
                    make.height.equalTo(30)
                    make.leading.equalTo(nameLabel.snp.trailing)
                }
                
                setLabel.snp.makeConstraints { make in
                    make.top.equalTo(nameLabel)
                    make.width.equalTo(70)
                    make.height.equalTo(30)
                    make.leading.equalTo(repsLabel.snp.trailing)
                }
                
                kgLabel.snp.makeConstraints { make in
                    make.top.equalTo(nameLabel)
                    make.width.equalTo(70)
                    make.height.equalTo(30)
                    make.leading.equalTo(setLabel.snp.trailing)
                }
            }else{
                nameLabel.backgroundColor = .yellow
                nameLabel.snp.makeConstraints { make in
                    make.top.equalTo(nameLabelArr[i - 1].snp.bottom).offset(10)
                    make.width.equalTo(150)
                    make.height.equalTo(30)
                    make.leading.equalTo(self)
                }
                
                
                repsLabel.snp.makeConstraints { make in
                    make.top.equalTo(nameLabel)
                    make.width.equalTo(70)
                    make.height.equalTo(30)
                    make.leading.equalTo(nameLabel.snp.trailing)
                }
                
                setLabel.snp.makeConstraints { make in
                    make.top.equalTo(nameLabel)
                    make.width.equalTo(70)
                    make.height.equalTo(30)
                    make.leading.equalTo(repsLabel.snp.trailing)
                }
                
                kgLabel.snp.makeConstraints { make in
                    make.top.equalTo(nameLabel)
                    make.width.equalTo(70)
                    make.height.equalTo(30)
                    make.leading.equalTo(setLabel.snp.trailing)
                }
                
            }
        }
    }
}
