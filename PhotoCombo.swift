//
//  PhotoCombo.swift
//  Insta
//
//  Created by Simiao Wang on 4/22/23.
//

import Foundation
import RealmSwift

class PhotoCombo: Object{
    @objc dynamic var imageDB: Data?
    @objc dynamic var titleDB: String = ""
    @objc dynamic var locationDB: String = ""
    
    override static func primaryKey() -> String? {
        return "titleDB"
    }
}
