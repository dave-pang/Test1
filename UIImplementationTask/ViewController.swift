//
//  ViewController.swift
//  UIImplementationTask
//
//  Created by dave.me on 2019/12/12.
//  Copyright © 2019 DavePang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MultipleCellDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: MutipleCellViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = MutipleCellViewModel(items:
            [
                Model1(imageURL: URL(string: "https://cdn3.iconfinder.com/data/icons/diagram_v2/PNG/96x96/diagram_v2-22.png")!,
                       title: "Seal team six",
                       subTitle: "Memoirs of an elite navy seal",
                       buttonType: .arrow),
                Model2(imageURL: URL(string: "https://cdn3.iconfinder.com/data/icons/diagram_v2/PNG/96x96/diagram_v2-19.png")!,
                       title: "A Clearing in the distance",
                       buttonType: .position),
                Model3(imageURL: URL(string: "https://cdn3.iconfinder.com/data/icons/diagram_v2/PNG/96x96/diagram_v2-20.png")!,
                        title: "A Clearing in the distance")
        ])
        
        tableView.dataSource = viewModel
    }
}


enum ModelItemType {
    case cell1
    case cell2
    case cell3
}

enum ButtonType {
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
    
    var imageURL: URL
    var title: String
    var subTitle: String
    var buttonType: ButtonType
}

struct Model2: ModelItem {
    let type: ModelItemType = .cell2
    
    var imageURL: URL
    var title: String
    var buttonType: ButtonType
}

struct Model3: ModelItem {
    let type: ModelItemType = .cell3
    
    var imageURL: URL
    var title: String
}


class TableViewCell1: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var item: ModelItem? {
        didSet {
            guard let item = item else { return }
        }
    }
}

class TableViewCell2: UITableViewCell {
    var item: ModelItem? {
        didSet {
            guard let item = item as? Model2 else { return }
        }
    }
}

class TableViewCell3: UITableViewCell {
    var item: ModelItem? {
        didSet {
        }
    }
}


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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell1", for: indexPath) as? TableViewCell1 else {
                return UITableViewCell()
            }
            
            return cell
        case .cell2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell2", for: indexPath) as? TableViewCell2 else {
                return UITableViewCell()
            }
            
            return cell
        case .cell3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell3", for: indexPath) as? TableViewCell3 else {
                return UITableViewCell()
            }
            
            return cell
        }
    }
}


extension UIView {
    func loadView(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
        
    }
    var mainView: UIView? {
        return subviews.first
        
    }
    
}
