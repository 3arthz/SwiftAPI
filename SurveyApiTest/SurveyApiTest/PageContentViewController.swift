//
//  PageContentViewController.swift
//  SurveyApiTest
//
//  Created by 3arthzneiz on 3/21/2560 BE.
//  Copyright © 2560 nimbl3test. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {
    
    var name: String?
    var descriptions: String?
    var imgUrl: String?
    var pageIndex: Int = 0
    
    
    @IBOutlet weak var NameSurvey: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var iMG: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SetUp()
    }
    // Set Page detail
    func SetUp(){
        if let url = NSURL(string: imgUrl! + "l") {
            if let data = NSData(contentsOf: url as URL) {
                iMG.image = UIImage(data: data as Data)
            }
        }
        NameSurvey.text = name
        Description.text = descriptions
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
