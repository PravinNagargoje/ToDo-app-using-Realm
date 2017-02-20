//
//  ToDoItem.swift
//  ToDO
//
//  Created by Mac on 08/02/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import RealmSwift

class ToDoItem: Object { // [2]
    dynamic var detail =  "" // [3]
    dynamic var status = "To Do"
}
