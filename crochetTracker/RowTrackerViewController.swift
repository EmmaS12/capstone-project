//
//  ViewController.swift
//  crochetTracker
//
//  Created by Emma Saccone on 4/19/25.
//

import UIKit

class RowTrackerViewController: UIViewController {
    
    // variable to hold the project passed form the list screen
    var currentProject: CrochetProject?

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
            print("decreaseRow tapped — currentRow is now: \(currentRow)")
                } else {
                    print("Already at row 0, can't decrease")
        }
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Check if a project was passed in from the previous screen
        if let project = currentProject {
            //use the row from the selected project
            currentRow = UserDefaults.standard.integer(forKey: "currentRow")
            // Update the label to show the project name and current row
            rowLabel.text = "\(project.name) — Row \(project.currentRow)"
        }

    }
}
