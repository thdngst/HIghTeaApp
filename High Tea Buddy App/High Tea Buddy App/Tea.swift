//
//  Tea.swift
//
//  Created by Rebecca on 7/6/20.
//  Copyright © 2020 iOS Buddy. All rights reserved.
//

import Foundation

struct Tea {
    var name: String
    var teaTypes: [TeaTypes]
    var mood: String
    
    init(name: String, teaTypes: [TeaTypes], mood: String) {
        self.name = name
        self.teaTypes = teaTypes
        self.mood = mood
    }
    
    struct TeaTypes {
        var name: String
        var timer: Int
        var desc: String
        var instruction: String
    }
}
