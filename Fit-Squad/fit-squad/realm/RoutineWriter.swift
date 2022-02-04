//
//  RoutineWriter.swift
//  Fit-Squad
//
//  Created by 김동준 on 2022/02/04.
//

import Foundation
import RealmSwift

class RoutineWriter{
    private let realm: Realm
    
    init(){
        try! realm = Realm()
    }
    
    public func writeRoutine(data: RoutineInfo){
        let json = DataConvert.shared.routineToJson(routine: data)
        let routine = RoutineRealm(jsonData: json)
        let result = Result{
            try realm.write{
                realm.add(routine)
            }
        }
        switch result{
        case .success():
            print("success to write realm")
        case .failure(let error):
            print(error)
        }
    
    }
    
    
    
}
