//
//  QuestionBank.swift
//  Quizzier101
//
//  Created by ict on 3/11/2561 BE.
//  Copyright © 2561 ictnaja. All rights reserved.
//

import Foundation

class QuestionBank {
    
    var list = [Question] ()
    
    init() {
        let item = Question (text: "ตูนคือคนที่เล่นกีต้าใช่ไหม", crroectAnswer: true)
        
        list.append(item)
        //index = 1
        list.append(Question(text: "ชัชมือกลองแต่งเพลงให้กับบอดี้สแลมทุกเพลงใช่ไหม", crroectAnswer: true))
        //index = 2
        list.append(Question(text: "เพลงนาฬิกาตาย ตูนบอดี้สแลมเป็นคนแต่งใช่ไหม", crroectAnswer: true))
        //index = 3
        list.append(Question(text: "ยอดเล่นเปียโนใช่ไหม", crroectAnswer: true))
        //index = 4
        list.append(Question(text: "ตูนคือคนที่วิ่งเผื่อรับบริจาคให้กับโรงบาลใช่ไหม", crroectAnswer: true))
        //index = 5
    }
    
}
