//
//  Model.swift
//  UIImplementationTask
//
//  Created by dave.me on 2019/12/12.
//  Copyright © 2019 DavePang. All rights reserved.
//

import Foundation

enum ModelItemType {
    case cell1
    case cell2
    case cell3
}

enum ButtonType: String {
    case arrow
    case check
    case position
    case none
}

protocol ModelItem {
    var type: ModelItemType { get }
    var title: String { get }
}

struct Model1: ModelItem {
    let type: ModelItemType = .cell1
    
    var imageURL: String
    var title: String
    var subTitle: String
    var buttonType: ButtonType
}

struct Model2: ModelItem {
    let type: ModelItemType = .cell2
    
    var imageURL: String
    var title: String
    var buttonType: ButtonType
}

struct Model3: ModelItem {
    let type: ModelItemType = .cell3
    
    var imageURL: String
    var title: String
}
