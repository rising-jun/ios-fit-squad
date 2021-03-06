//
//  ReCordViewController.swift
//  Fit-Squad
//
//  Created by 김동준 on 2022/02/03.
//

import Foundation
import UIKit

class RecordViewController: BaseViewController {
    lazy var v = RecordView(frame: view.frame)
    
    let dummyData = ["운동1", "운동2", "운동3"]
    
    // 추가된 운동 객체가 들어오는 부분. RoutineView에서 append 해줌.
    var exercises: [ExerciseInfo] = []
    var isRoutineStarted: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = v
        v.routineTableView.dataSource = self
        v.routineTableView.delegate = self

        setAddButton()
        v.startButton.addTarget(self, action: #selector(startRoutine), for: .touchUpInside)
    }
    
    func setAddButton() {
        tabBarController?.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addExercises)), animated: false)
    }
    
    @objc func addExercises() {
        // routine view로 이동
        navigationController?.pushViewController(RoutineViewController(), animated: true)
    }
    
    func updateExercises(newExercise: ExerciseInfo) {
        exercises.append(newExercise)
        v.routineTableView.reloadData()
    }
    
    @objc func startRoutine() {
        // 루틴 시작. 추가 비활성화. 체크 활성화. 완료버튼으로 변경.
        tabBarController?.navigationItem.rightBarButtonItem?.isEnabled = false
        activateCheckmark()
        v.startButtonPressed()
        v.completeButton.addTarget(self, action: #selector(endRoutine), for: .touchUpInside)
    }
    
    @objc func endRoutine() {
        tabBarController?.navigationItem.rightBarButtonItem?.isEnabled = true
        v.completeButtonPressed()
        
        let currentRoutine = RoutineInfo()
        currentRoutine.exercises = exercises
        currentRoutine.date = .now
        RoutineWriter().writeRoutine(data: currentRoutine)
        
        // dummy data여서 현재는 cell이 사라지지 않음.
        exercises.removeAll()
        v.routineTableView.reloadData()
        
        tabBarController?.selectedIndex = 0
    }
    
    func activateCheckmark() {
        // 운동에 완료표시 할 수 있도록 설정.
        isRoutineStarted = true
        v.routineTableView.reloadData()
    }
}

extension RecordViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if exercises.count == 0 {
            // 만약 exercises가 empty인 경우, '운동을 추가해주세요' 메시지 띄우기
        }
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ExercisesCell = v.routineTableView.dequeueReusableCell(withIdentifier: ExercisesCell.identifier, for: indexPath) as! ExercisesCell
        // table view 세팅 시 excerscises 배열에서 데이터를 입력해줌. (현재는 Dummy)
        cell.setCellContents(excercise: exercises[indexPath.row])
        cell.awakeFromNib()
        cell.delegate = self
        if isRoutineStarted { cell.activate() }
        return cell
    }
    
    
}

extension RecordViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
}


extension RecordViewController: ExercisesCellDelegate {
    func checkBeforeActivate() {
        let alert = UIAlertController(title: "운동을 시작해주세요", message: "운동을 시작한 후에 완료 표시를 할 수 있습니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}




#if DEBUG
import SwiftUI

extension UIViewController {
   private struct Preview: UIViewControllerRepresentable {
           let viewController: UIViewController

           func makeUIViewController(context: Context) -> UIViewController {
               return viewController
           }

           func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
           }
       }

       func toPreview() -> some View {
           Preview(viewController: self)
       }
}

struct PreView: PreviewProvider {
   static var previews: some View {
       SplashViewController().toPreview()
   }
}
#endif
