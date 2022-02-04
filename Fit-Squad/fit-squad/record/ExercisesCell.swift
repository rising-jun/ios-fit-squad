//
//  ExercisesCell.swift
//  Fit-Squad
//
//  Created by Bumgeun Song on 2022/02/03.
//

import UIKit
import SnapKit

protocol ExercisesCellDelegate {
    func checkBeforeActivate()
}

class ExercisesCell: UITableViewCell {

    static let identifier = "ExerciesesCell"
    private var excercise: ExerciseInfo?
    private var isActivated: Bool = false
    var delegate: ExercisesCellDelegate?
    
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nameLabel.text = excercise?.name
        return nameLabel
    }()
    
    lazy var repsLabel: UILabel = {
        let repsLabel = UILabel()
        repsLabel.text = "\(excercise?.reps ?? 0)"
        repsLabel.font = UIFont.systemFont(ofSize: 15)
        return repsLabel
    }()
    
    lazy var setLabel: UILabel = {
        let setLabel = UILabel()
//        setLabel.text = "5 sets"
        repsLabel.font = UIFont.systemFont(ofSize: 15)
        setLabel.text = "\(excercise?.set ?? 0)"
        return setLabel
    }()
    
    lazy var checkbox: UIButton = {
        let checkbox = UIButton()
        checkbox.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        checkbox.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        return checkbox
    }()
    
    lazy var kgLabel: UILabel = {
        let kgLabel = UILabel()
//        kgLabel.text = "100kg"
        kgLabel.font = UIFont.systemFont(ofSize: 15)
        kgLabel.text = "\(excercise?.kg ?? 0)"
        return kgLabel
    }()
    
    lazy var bottomStack: UIStackView = {
        let bottomStack = UIStackView()
        bottomStack.axis = .horizontal
        bottomStack.distribution = .fillEqually
        bottomStack.backgroundColor = .white
        return bottomStack
    }()
    
    lazy var excerciseStack: UIStackView = {
        let excerciseStack = UIStackView()
        excerciseStack.axis = .vertical
        excerciseStack.distribution = .fillEqually
        return excerciseStack
    }()
    
    lazy var nameStack: UIStackView = {
        let nameStack = UIStackView()
        nameStack.axis = .horizontal
        nameStack.distribution = .fill
        nameStack.backgroundColor = .white
        return nameStack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
        checkbox.addTarget(self, action: #selector(checkPressed), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func activate() {
        self.isActivated = true
    }
    
    func setupLayout() {
        // 운동 이름, 횟수, 세트, 중량의 레이아웃을 설정
        contentView.addSubview(excerciseStack)
        
        excerciseStack.addArrangedSubview(nameStack)
        nameStack.addArrangedSubview(nameLabel)
        nameStack.addArrangedSubview(checkbox)
        
        excerciseStack.addArrangedSubview(bottomStack)
        bottomStack.addArrangedSubview(repsLabel)
        bottomStack.addArrangedSubview(setLabel)
        bottomStack.addArrangedSubview(kgLabel)
        
        excerciseStack.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self)
            make.height.equalTo(100)
        }
        
        checkbox.snp.makeConstraints { make in
            make.width.lessThanOrEqualTo(50)
        }
    }
    
    func setCellContents(excercise: ExerciseInfo) {
        self.excercise = excercise
    }
    
    @objc func checkPressed() {
        if isActivated {
            checkbox.isSelected = !checkbox.isSelected
        } else {
            delegate?.checkBeforeActivate()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
