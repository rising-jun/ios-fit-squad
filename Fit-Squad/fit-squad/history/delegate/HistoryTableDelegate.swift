//
//  HistoryTableDelegate.swift
//  Fit-Squad
//
//  Created by 김동준 on 2022/02/03.
//

import Foundation
import UIKit

class HistoryTableDelegate: NSObject{
    var routineArr: [RoutineInfo] = []
}

extension HistoryTableDelegate: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routineArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell") as! HistoryCell
        
        cell.setRoutinArr(self.routineArr[indexPath.row])
        cell.awakeFromNib()
        return cell
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat((70 + (40 * self.routineArr[indexPath.row].exercises.count)))
    }
    
}
