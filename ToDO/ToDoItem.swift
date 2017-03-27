//
//  ToDoItem.swift
//  ToDO
//
//  Created by Mac on 08/02/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import RealmSwift

class ToDoItem: Object {
    dynamic var detail =  ""
    dynamic var status = "remaining"
    dynamic var currentDate = ""
}
