//
//  CreateProjectViewController.swift
//  crochetTracker
//
//  Created by Emma Saccone on 4/23/25.
//

import UIKit

//protocol to send a new project back to the previous screen
//Any class that adopts this must implement the didCreateMethod
protocol CreateProjectDelegate: AnyObject {
    func didCreateProject(_ project: CrochetProject)
}


class CreateProjectViewController: UIViewController {
    
    //The delegate is someone who "listens" for when a new project is created
    //we'll call this later to send the project back to the ProjectListViewController
    weak var delegate: CreateProjectDelegate?


    //save project
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        //user writes project or user enters nothing project doesn't save
        guard let name = projectName.text, !name.isEmpty, name != "Project Name" else {
            print("⚠️ save tapped but name field was empty")
            return
        }
        
        //creating a new project row is always 0 for new project
        let newProject = CrochetProject(name: name, currentRow: 0)
        print("✅ save tapped, created newProject:", newProject)
        
        //Send the new project back to whoever is listening (delegate)
        delegate?.didCreateProject(newProject)
        print("📣 didCreateProject called on delegate:", delegate as Any) // 🔍

        // Close the Add Project screen
        dismiss(animated: true, completion: nil)

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
