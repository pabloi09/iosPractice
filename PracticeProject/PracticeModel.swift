//
//  PracticeModel.swift
//  PracticeProject
//
//  Created by Pablo Martín Redondo on 17/11/2019.
//  Copyright © 2019 Pablo Martín Redondo. All rights reserved.
//

import Foundation

struct PracticeItem{
    var x: String
    var y: String
}

class PracticeModel {
    var items : [PracticeItem] = [PracticeItem(x: "", y: "")]
    
    func addItem(){
        items.append(PracticeItem(x: "", y: ""))
    }
    
    func deleteItem(pos:Int){
        items.remove(at: pos)
    }
    
    func resetList(){
        items = [PracticeItem(x: "", y: "")]
    }
}
