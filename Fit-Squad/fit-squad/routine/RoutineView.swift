//
//  RoutineView.swift
//  Fit-Squad
//
//  Created by 김상혁 on 2022/02/03.
//

import Foundation
import UIKit
import SnapKit
import Then

class RoutineView: BaseView {
    
    @objc
    func setCountPlusBtnTouched() {
        print("+")
        guard let currentSetCountText = setCountLabel.text else { return }
        guard var count = Int(currentSetCountText) else { return }
        count += 1
        setCountLabel.text = String(count)
    }

    @objc
    func setCountMinusBtnTouched() {
        print("-")
        guard let currentSetCountText = setCountLabel.text else { return }
        guard var count = Int(currentSetCountText) else { return }
        count -= 1
        setCountLabel.text = String(count)
    }
    
    @objc
    func addExerciseBtnTouched() {
        guard let exerciseName = exerciseNameSearchTextField.text else { return }
        guard let repCount = repCountTextField.text else { return }
        guard let weight = weightTextField.text else { return }
        guard let setCount = setCountLabel.text else { return }
//        let exerciseInfo = ExerciseInfo(exerciseName: exerciseName, repCount: repCount, setCount: setCount, weight: weight)
//        print("\(exerciseInfo.exerciseName), \(exerciseInfo.repCount), \(exerciseInfo.setCount), \(exerciseInfo.weight)")
        print("\(exerciseName), \(repCount), \(setCount), \(weight)")
//        return exerciseInfo
    }
    
    
    lazy var addTitleText = UILabel().then {
        $0.text = "운동 추가하기"
        $0.font = UIFont.boldSystemFont(ofSize: 30)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
    }

    
    lazy var exerciseNameText = UILabel().then {
        $0.text = "운동 이름"
        $0.font = UIFont.boldSystemFont(ofSize: 25)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
    }
    lazy var exerciseNameSearchTextField = UISearchTextField().then {
        $0.placeholder = "Search Exersices"
        $0.backgroundColor = .systemGray6
    }
    
    
    lazy var repText = UILabel().then {
        $0.text = "반복 횟수"
        $0.font = UIFont.boldSystemFont(ofSize: 25)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
    }
    lazy var repCountTextField = UITextField().then {
        $0.keyboardType = .numberPad
        $0.textAlignment = .center
        $0.backgroundColor = .systemGray5
        $0.layer.cornerRadius = 10
    }
    lazy var repCountText = UITextField().then {
        $0.text = "회"
        $0.font = UIFont.boldSystemFont(ofSize: 25)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
    }
    
    
    lazy var setCountText = UILabel().then {
        $0.text = "세트 수"
        $0.font = UIFont.boldSystemFont(ofSize: 25)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
    }
    lazy var setCountLabel = UILabel().then {
        $0.text = "1"
        $0.font = UIFont.boldSystemFont(ofSize: 25)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
    }
    lazy var setCountPlusBtn = UIButton().then {
        $0.setTitle("+", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(setCountPlusBtnTouched), for: .touchUpInside)
    }
    lazy var setCountMinusBtn = UIButton().then {
        $0.setTitle("-", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(setCountMinusBtnTouched), for: .touchUpInside)
    }
    
    
    lazy var weight = UILabel().then {
        $0.text = "중량"
        $0.font = UIFont.boldSystemFont(ofSize: 25)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
    }
    lazy var weightTextField = UITextField().then {
        $0.keyboardType = .numberPad
        $0.textAlignment = .center
        $0.backgroundColor = .systemGray5
        $0.layer.cornerRadius = 10
    }
    lazy var weightCountText = UILabel().then {
        $0.text = "Kg"
        $0.font = UIFont.boldSystemFont(ofSize: 25)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
    }
    

    lazy var addExerciseBtn = UIButton().then {
        $0.setTitle("추가", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(addExerciseBtnTouched), for: .touchUpInside)
    }
    
    
    override func setupUI() {
        super.setupUI()
        backgroundColor = .white

        addSubview(addTitleText)
        
        addSubview(exerciseNameText)
        addSubview(exerciseNameSearchTextField)
        
        addSubview(repText)
        addSubview(repCountTextField)
        addSubview(repCountText)
        
        addSubview(setCountText)
        addSubview(setCountLabel)
        addSubview(setCountPlusBtn)
        addSubview(setCountMinusBtn)
        
        addSubview(weight)
        addSubview(weightTextField)
        addSubview(weightCountText)
        
        addSubview(addExerciseBtn)
        
        addTitleText.snp.makeConstraints{ make in
            make.top.equalTo(self).offset(125)
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-20)
        }
        
        exerciseNameText.snp.makeConstraints{ make in
            make.top.equalTo(addTitleText).offset(70)
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-250)
        }
        exerciseNameSearchTextField.snp.makeConstraints{ make in
            make.top.equalTo(addTitleText).offset(70)
            make.leading.equalTo(exerciseNameText).offset(130)
            make.trailing.equalTo(self).offset(-100)
            make.height.equalTo(30)
        }
        
        
        repText.snp.makeConstraints{ make in
            make.top.equalTo(exerciseNameText).offset(70)
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-250)
        }
        repCountTextField.snp.makeConstraints{ make in
            make.top.equalTo(exerciseNameText).offset(70)
            make.leading.equalTo(repText).offset(130)
            make.trailing.equalTo(self).offset(-100)
            make.height.equalTo(30)
        }
        repCountText.snp.makeConstraints{ make in
            make.top.equalTo(exerciseNameText).offset(70)
            make.leading.equalTo(repCountTextField).offset(120)
            make.trailing.equalTo(self).offset(-20)
        }
        
        
        setCountText.snp.makeConstraints{ make in
            make.top.equalTo(repText).offset(70)
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-250)
        }
        setCountLabel.snp.makeConstraints{ make in
            make.top.equalTo(repText).offset(70)
            make.leading.equalTo(setCountText).offset(20)
            make.trailing.equalTo(self).offset(-20)
        }
        setCountPlusBtn.snp.makeConstraints{ make in
            make.top.equalTo(repText).offset(70)
            make.leading.equalTo(setCountLabel).offset(120)
            make.trailing.equalTo(self).offset(-20)
            make.width.equalTo(1)
        }
        setCountMinusBtn.snp.makeConstraints{ make in
            make.top.equalTo(repText).offset(70)
            make.leading.equalTo(setCountPlusBtn).offset(130)
            make.trailing.equalTo(self).offset(-20)
            make.width.equalTo(1)
        }
        
        
        weight.snp.makeConstraints{ make in
            make.top.equalTo(setCountText).offset(70)
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-250)
        }
        weightTextField.snp.makeConstraints{ make in
            make.top.equalTo(setCountText).offset(70)
            make.leading.equalTo(weight).offset(130)
            make.trailing.equalTo(self).offset(-100)
            make.height.equalTo(30)
        }
        weightCountText.snp.makeConstraints{ make in
            make.top.equalTo(setCountText).offset(70)
            make.leading.equalTo(weightTextField).offset(130)
            make.trailing.equalTo(self).offset(-20)
        }
        
        
        addExerciseBtn.snp.makeConstraints{ make in
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-20)
            make.bottom.equalTo(self).offset(-50)
        }
    }
}

