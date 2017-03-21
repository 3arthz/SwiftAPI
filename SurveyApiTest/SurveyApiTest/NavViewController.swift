//
//  NavViewController.swift
//  SurveyApiTest
//
//  Created by 3arthzneiz on 3/21/2560 BE.
//  Copyright © 2560 nimbl3test. All rights reserved.
//

import UIKit

class NavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Config Navigation
    func setupNav(){
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.navigationBar.tintColor = .white
        self.navigationBar.barTintColor = UIColor(red: 20.0/255.0, green: 0.0/255.0, blue: 10.0/255.0, alpha: 1)
        self.navigationBar.isTranslucent = false
    }
}
