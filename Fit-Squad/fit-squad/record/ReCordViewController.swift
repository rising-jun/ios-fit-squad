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
    
    let tableData = ["운동1", "운동2", "운동3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = v
        v.routineTableView.dataSource = self
    }
}

extension RecordViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ExercisesCell = v.routineTableView.dequeueReusableCell(withIdentifier: ExercisesCell.identifier, for: indexPath) as! ExercisesCell
        var config = cell.defaultContentConfiguration()
        config.text = tableData[indexPath.row]
        cell.contentConfiguration = config
        return cell
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
       RecordViewController().toPreview()
   }
}
#endif
