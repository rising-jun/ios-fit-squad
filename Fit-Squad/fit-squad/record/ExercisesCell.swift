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
    
    lazy var nameLabelArr: [UILabel] = []
    lazy var repsLabelArr: [UILabel] = []
    lazy var setLabelArr: [UILabel] = []
    lazy var kgLabelArr: [UILabel] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        // 운동 이름, 횟수, 세트, 중량의 뷰를 설정
        
    }
    
    func activateCheckmark() {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
