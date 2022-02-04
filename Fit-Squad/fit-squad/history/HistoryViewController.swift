//
//  HistoryViewController.swift
//  Fit-Squad
//
//  Created by 김동준 on 2022/02/03.
//

import Foundation
import UIKit

class HistoryViewController: BaseViewController{
    
    lazy var v = HistoryView(frame: view.frame)
    private let historyDelegate = HistoryTableDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        setView()
        setNavigateBar()
        
    }
    
    
}
extension HistoryViewController{
    
    func setView(){
        view = v
        
        v.tableView.register(HistoryCell.self, forCellReuseIdentifier: "historyCell")
        v.tableView.delegate = historyDelegate
        v.tableView.dataSource = historyDelegate
    }
    
    func setNavigateBar(){
        self.tabBarController!.navigationItem.hidesBackButton = true
        self.tabBarController?.navigationItem.leftBarButtonItem = self.v.setNavigationBarIconView()
    }
    
}
