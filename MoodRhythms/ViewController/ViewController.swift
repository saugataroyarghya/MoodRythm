//
//  ViewController.swift
//  MoodRhythms
//
//  Created by kuet on 12/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bgimg: UIImageView!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
        
        
    }
    func setUpElements ()
    {
                Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
    }
    
}

