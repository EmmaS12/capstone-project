//
//  ViewController.swift
//  crochetTracker
//
//  Created by Emma Saccone on 4/19/25.
//

import UIKit

class RowTrackerViewController: UIViewController {
    
    //row label shows row number
    //row counter starts at zero when the app launches
    @IBOutlet weak var rowLabel: UILabel!
    var currentRow = 0 {
        //block of code that runs everytime row variable changes
        didSet {
            //updates the row label on the screen to show the new number
            rowLabel?.text="Row: \(currentRow)"
            //This saves the row number whenever it changes, like after a button pressed
            UserDefaults.standard.set(currentRow, forKey: "currentRow")

        }
    }
    
    // + button to increase row number
    @IBAction func increaseRow(_ sender: UIButton) {
        currentRow += 1
        print("increaseRow tapped — currentRow is now: \(currentRow)")
    }
    
    // - button to decrease row number
    @IBAction func decreaseRow(_ sender: UIButton) {
        if currentRow > 0{
            currentRow -= 1
        }
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //This loads the saved row number when the app starts.
        currentRow = UserDefaults.standard.integer(forKey: "currentRow")

    }
}

