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
    
    
    @IBOutlet weak var TakeSurvey: UIButton!
    @IBOutlet weak var NameSurvey: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var iMG: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SetUp()
        SetButton()
    }
    // Set Page detail
    func SetUp(){
        //Set HD Quality Picture
        if let url = NSURL(string: imgUrl! + "l") {
            if let data = NSData(contentsOf: url as URL) {
                iMG.image = UIImage(data: data as Data)
            }
        }
        NameSurvey.text = name
        Description.text = descriptions
    }
    func SetButton(){
        TakeSurvey.layer.cornerRadius = TakeSurvey.frame.size.width / 8
        TakeSurvey.clipsToBounds = true
        TakeSurvey.backgroundColor = UIColor(red: 200/255.0, green: 10/255.0, blue: 10/255.0, alpha: 1)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
