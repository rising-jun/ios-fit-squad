//
//  ExercisesCell.swift
//  Fit-Squad
//
//  Created by Bumgeun Song on 2022/02/03.
//

import UIKit
import SnapKit

class ExercisesCell: UITableViewCell {

    static let identifier = "ExerciesesCell"
    private var excercise: ExerciseInfo?
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Bench Press"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
//        nameLabel.text = excercise?.name
        return nameLabel
    }()
    
    lazy var repsLabel: UILabel = {
        let repsLabel = UILabel()
        repsLabel.text = "10"
//        repsLabel.text = "\(excercise?.reps ?? 0)"
        return repsLabel
    }()
    
    lazy var setLabel: UILabel = {
        let setLabel = UILabel()
        setLabel.text = "5"
//        setLabel.text = "\(excercise?.set ?? 0)"
        return setLabel
    }()
    
    lazy var kgLabel: UILabel = {
        let kgLabel = UILabel()
        kgLabel.text = "100kg"
//        kgLabel.text = "\(excercise?.kg ?? 0)"
        return kgLabel
    }()
    
    lazy var bottomStack: UIStackView = {
        let bottomStack = UIStackView()
        bottomStack.axis = .horizontal
        bottomStack.distribution = .fillEqually
        bottomStack.backgroundColor = .yellow
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
        nameStack.backgroundColor = .systemBrown
        return nameStack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        // 운동 이름, 횟수, 세트, 중량의 레이아웃을 설정
        contentView.addSubview(excerciseStack)
        
        
        
        excerciseStack.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self)
            make.height.equalTo(100)
        }
        
        excerciseStack.addArrangedSubview(nameStack)
        nameStack.addArrangedSubview(nameLabel)
        
        excerciseStack.addArrangedSubview(bottomStack)
        bottomStack.addArrangedSubview(repsLabel)
        bottomStack.addArrangedSubview(setLabel)
        bottomStack.addArrangedSubview(kgLabel)
        
    }
    
    
    func setCellContents(excercise: ExerciseInfo) {
        self.excercise = excercise
    }
    
    func activateCheckmark() {
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
