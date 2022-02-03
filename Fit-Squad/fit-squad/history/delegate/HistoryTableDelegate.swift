//
//  HistoryTableDelegate.swift
//  Fit-Squad
//
//  Created by 김동준 on 2022/02/03.
//

import Foundation
import UIKit

class HistoryTableDelegate: NSObject{
    
    var routine = RoutineInfo()
    override init(){
        super.init()
        for i in 0 ..< 1{
            var exercise = ExerciseInfo()
            exercise.name = "exercise\(i)"
            routine.exercises.append(exercise)
        }
    }
    
}

extension HistoryTableDelegate: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell") as! HistoryCell
        cell.setRoutinArr(self.routine)
        cell.awakeFromNib()
        return cell
    }
    
    
}
