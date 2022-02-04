//
//  RoutineReader.swift
//  Fit-Squad
//
//  Created by 김동준 on 2022/02/04.
//

import Foundation
import RealmSwift

class RoutineReader{
    private let realm: Realm
    
    init(){
        try! realm = Realm()
    }
    
    public func readRoutine() -> [RoutineInfo]{
        let routines = realm.objects(RoutineRealm.self)
        let routineRealmArray = Array(routines)
        return routineRealmArray.map{DataConvert.shared.jsonToRoutine(routine: $0)}
        
    }
    
}
