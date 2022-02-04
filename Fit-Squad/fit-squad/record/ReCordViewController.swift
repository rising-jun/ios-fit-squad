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
    var exercises: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = v
        v.routineTableView.dataSource = self
        setAddButton()
    }
    
    func setAddButton() {
        tabBarController?.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addExercises)), animated: false)
    }
    
    
    
    @objc func addExercises() {
        // routine view로 이동
        navigationController?.pushViewController(RoutineViewController(), animated: true)
    }
}

extension RecordViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if dummyData.count == 0 {
            // 만약 exercises가 empty인 경우, '운동을 추가해주세요' 메시지 띄우기
        }
        
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ExercisesCell = v.routineTableView.dequeueReusableCell(withIdentifier: ExercisesCell.identifier, for: indexPath) as! ExercisesCell
        var config = cell.defaultContentConfiguration()
        config.text = dummyData[indexPath.row]
        cell.contentConfiguration = config
        return cell
    }
}

extension RecordViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 클릭하면 체크마크 토글
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
