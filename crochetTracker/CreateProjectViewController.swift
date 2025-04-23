//
//  AddProjectViewController.swift
//  crochetTracker
//
//  Created by Emma Saccone on 4/23/25.
//

import UIKit

class CreateProjectViewController: UIViewController {

    //save project
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        //user writes project or user enters nothing project doesn't save
        guard let name = projectName.text, !name.isEmpty else {
            return
        }
        //creating a new project row is always 0 for new project
        var newProject = CrochetProject(name: name, currentRow: 0)
    }
    
    @IBOutlet weak var projectName: UITextField!
    
    @IBOutlet weak var startingRowTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
