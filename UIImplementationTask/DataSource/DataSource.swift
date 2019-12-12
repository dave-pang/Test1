//
//  DataSource.swift
//  UIImplementationTask
//
//  Created by dave.me on 2019/12/12.
//  Copyright © 2019 DavePang. All rights reserved.
//

import UIKit

protocol MultipleCellDataSource {
    var viewModel: MutipleCellViewModel! { get }
}

class MutipleCellViewModel: NSObject {
    var items: [ModelItem]!
    
    init(items: [ModelItem]) {
        super.init()
        self.items = items
    }
}

extension MutipleCellViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        switch item.type {
        case .cell1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell1.className, for: indexPath) as? TableViewCell1 else {
                return UITableViewCell()
            }
            
            cell.view.item = item
            
            return cell
        case .cell2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell2.className, for: indexPath) as? TableViewCell2 else {
                return UITableViewCell()
            }
            
            cell.view.item = item
            
            return cell
        case .cell3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell3.className, for: indexPath) as? TableViewCell3 else {
                return UITableViewCell()
            }
            
            cell.view.item = item
            
            return cell
        }
    }
}
