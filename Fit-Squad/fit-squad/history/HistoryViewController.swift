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
    private let write = RoutineWriter()
    private let read = RoutineReader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setNavigateBar()
        
        
        //read.readRoutine()
        //write.writeRoutine(data: routine)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // update table view
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.updateTableView { routineArr in
                
            }
            
        }
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
        
        self.tabBarController!.navigationItem.leftBarButtonItem
        self.tabBarController!.navigationItem.hidesBackButton = true
        self.tabBarController?.navigationItem.leftBarButtonItem = self.v.setNavigationBarIconView()
    }
    
    func updateTableView(_ getRoutine: ([RoutineInfo]) -> Void ){
            var routineArr = self.read.readRoutine()
            getRoutine(routineArr)
        
    }
    
}

extension HistoryViewController: HistoryProtocol{
    func updateTableView(routineArr: [RoutineInfo]) {
        historyDelegate.routineArr = routineArr
        v.tableView.reloadData()
    }
    
    
}
