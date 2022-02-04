//
//  RoutineViewController.swift
//  Fit-Squad
//
//  Created by 김동준 on 2022/02/03.
//

import Foundation
import UIKit

class RoutineViewController: BaseViewController {
    lazy var v = RoutineView(frame: view.frame)
    
    @objc
    func completeAddExercises() {
        navigationController?.popViewController(animated: true)
    }
    
    
    @objc
    func setCountPlusBtnTouched() {
        guard let currentSetCountText = v.setCountLabel.text else { return }
        guard var count = Int(currentSetCountText) else { return }
        count += 1
        v.setCountMinusBtn.isEnabled = true
        v.setCountLabel.text = String(count)
    }
    
    @objc
    func setCountMinusBtnTouched() {
        guard let currentSetCountText = v.setCountLabel.text else { return }
        guard var count = Int(currentSetCountText) else { return }
        
        if count == 1 {
            v.setCountMinusBtn.isEnabled = false
            return
        }
        
        count -= 1
        v.setCountLabel.text = String(count)
    }
    
    @objc
    func addExerciseBtnTouched() {
        guard let exerciseName = v.exerciseNameSearchTextField.text else { return }
        
        guard let repCount = v.repCountTextField.text else { return }
        guard let weight = v.weightTextField.text else { return }
        guard let setCount = v.setCountLabel.text else { return }
        
        guard let repCountInt = Int(repCount) else { return }
        guard let weightInt =  Int(weight) else { return }
        guard let setCountInt = Int(setCount) else { return }
        
        let exerciseInfo = ExerciseInfo()
        exerciseInfo.name = exerciseName
        exerciseInfo.reps = repCountInt
        exerciseInfo.set = setCountInt
        exerciseInfo.kg = weightInt
        
        guard let nv = navigationController else { return }
        let count = nv.viewControllers.count
        let tabVC = navigationController?.children[0] as? UITabBarController
        let recordVC = tabVC?.children[1] as? RecordViewController
        recordVC?.updateExercises(newExercise: exerciseInfo)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = v
        
        v.setCountPlusBtn.addTarget(self, action: #selector(setCountPlusBtnTouched), for: .touchUpInside)
        
        v.setCountMinusBtn.addTarget(self, action: #selector(setCountMinusBtnTouched), for: .touchUpInside)
        
        v.addExerciseBtn.addTarget(self, action: #selector(completeAddExercises), for: .touchUpInside)
        
        v.addExerciseBtn.addTarget(self, action: #selector(addExerciseBtnTouched), for: .touchUpInside)
        
        
    }
}
