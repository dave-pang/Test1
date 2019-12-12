//
//  ModelView1.swift
//  UIImplementationTask
//
//  Created by dave.me on 2019/12/12.
//  Copyright © 2019 DavePang. All rights reserved.
//

import UIKit

final class ModelView2: UIView {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        backgroundColor = .clear
        guard let view = loadView(nibName: "ModelView2") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
}
