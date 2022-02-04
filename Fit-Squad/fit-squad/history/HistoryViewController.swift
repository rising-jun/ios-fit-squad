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
    private var historyProtocol: HistoryProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setNavigateBar()
        historyProtocol = self

        //read.readRoutine()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // update table view
        
        //DispatchQueue.global(qos: .background).async { [weak self] in
           // guard let self = self else { return }
            var routineArr = self.read.readRoutine()
            self.historyProtocol?.updateTableView(routineArr: routineArr)
        //}
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

extension HistoryViewController: HistoryProtocol{
    func updateTableView(routineArr: [RoutineInfo]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.historyDelegate.routineArr = routineArr
            self.v.tableView.reloadData()
        }
    }
    
    
}
