//
//  Model.swift
//  Wishlist..
//
//  Created by Arjun Rana on 15/04/26.
//

import Foundation
import SwiftData

@Model
class Wish {
    var title : String
    init(title: String) {
        self.title = title
    }
}
