//
//  DataConvert.swift
//  Fit-Squad
//
//  Created by 김동준 on 2022/02/04.
//

import Foundation

class DataConvert{
    static var shared = DataConvert()
    private init(){}
    
    final func routineToJson(routine: RoutineInfo) -> String{
        var json = ""
        let jsonEncoder = JSONEncoder()
        
        let result = Result{
            try! jsonEncoder.encode(routine)
        }
        
        switch result {
        case .success(let data):
            json = String(data: data, encoding: .utf8)!
            
        case .failure(let error):
            print("json error \(error)")
        }
        
        return json
    }
    
    final func jsonToRoutine(routine: RoutineRealm) -> RoutineInfo{
        let jsonDecoder = JSONDecoder()
        let data = routine.routine.data(using: .utf8)
        let routineInfo = try! jsonDecoder.decode(RoutineInfo.self, from: data!)
        return routineInfo
    }
}
