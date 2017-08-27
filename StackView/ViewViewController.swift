//
//  ViewViewController.swift
//  StackView
//
//  Created by Raju on 8/10/17.
//  Copyright © 2017 rajubd49. All rights reserved.
//

import UIKit

class ViewViewController: UIViewController {

    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var mainStackViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var leftStackView: UIStackView!
    @IBOutlet weak var rightStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if ((UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft) || (UIDevice.current.orientation ==  UIDeviceOrientation.landscapeRight)) {
            mainStackView.axis = .horizontal
            mainStackViewHeightConstraint.constant = leftStackView.frame.size.height
        } else {
            mainStackView.axis = .vertical
            mainStackViewHeightConstraint.constant = leftStackView.frame.size.height * 2
        }
    }
}
