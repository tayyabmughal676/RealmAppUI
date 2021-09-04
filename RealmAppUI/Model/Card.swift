//
//  Card.swift
//  RealmAppUI
//
//  Created by Thor on 01/09/2021.
//

import Foundation
import RealmSwift


//Creating Realm Object...
class Card: Object, Identifiable{
    
    @objc dynamic var id : Date = Date()
    @objc dynamic var title = ""
    @objc dynamic var detail = ""
    
}
