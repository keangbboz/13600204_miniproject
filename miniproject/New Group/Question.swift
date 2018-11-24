//
//  Question.swift
//  Quizzier101
//
//  Created by ict on 3/11/2561 BE.
//  Copyright © 2561 ictnaja. All rights reserved.
//

import Foundation

class Question {
    let answer : Bool
    let questionText : String
    
    init(text : String, crroectAnswer : Bool) { //text เซ็ตค่าเริ่มต้นให้กับ??
        questionText = text
        answer =  crroectAnswer
    }
}
