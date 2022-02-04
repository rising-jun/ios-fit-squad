//
//  Entity.swift
//  Fit-Squad
//
//  Created by 김동준 on 2022/02/03.
//

import Foundation
import RealmSwift

class RoutineRealm: Object, Codable{
    @objc dynamic var routine: String = ""
    
    convenience init(jsonData: String) {
        self.init()
        self.routine = jsonData
    }
}

class RoutineInfo: Object, Codable{
    @objc dynamic var date: Date = Date()
    var exercises: [ExerciseInfo] = []
}

class ExerciseInfo: Object, Codable{
    @objc dynamic var name: String = Name.none.rawValue
    @objc dynamic var set: Int = 0
    @objc dynamic var reps: Int = 0
    @objc dynamic var kg: Int = 0
    
}

enum Name: String{
    case pullup = "pull up"
    case none = "none"
}
