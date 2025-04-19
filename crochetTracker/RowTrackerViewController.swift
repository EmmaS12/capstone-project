//
//  ViewController.swift
//  crochetTracker
//
//  Created by Emma Saccone on 4/19/25.
//

import UIKit

class RowTrackerViewController: UIViewController {
    
    //row label shows row number
    @IBOutlet weak var rowLabel: UILabel!
    // + button to increase row number
    @IBAction func increaseRow(_ sender: UIButton) {
    }
    // - button to decrease row number
    @IBAction func decreaseRow(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        
        var currentRow = 0 //row counter starts at zero when the app launches
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

