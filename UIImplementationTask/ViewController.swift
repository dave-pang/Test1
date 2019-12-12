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
                Model1(imageURL: "https://cdn3.iconfinder.com/data/icons/diagram_v2/PNG/96x96/diagram_v2-22.png",
                       title: "Seal team six",
                       subTitle: "Memoirs of an elite navy seal",
                       buttonType: .arrow),
                Model2(imageURL: "https://cdn3.iconfinder.com/data/icons/diagram_v2/PNG/96x96/diagram_v2-19.png",
                       title: "A Clearing in the distance",
                       buttonType: .position),
                Model3(imageURL: "https://cdn3.iconfinder.com/data/icons/diagram_v2/PNG/96x96/diagram_v2-20.png",
                        title: "A Clearing in the distance")
        ])
        
        tableView.dataSource = viewModel
    }
}
