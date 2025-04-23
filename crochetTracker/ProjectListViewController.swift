//
//  ProjectListViewController.swift
//  crochetTracker
//
//  Created by Emma Saccone on 4/20/25.
//
import UIKit

class ProjectListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CreateProjectDelegate {

    //This function is required by the CreateProjectDelegate protocol
    //It gets called when a new project is created in the Create Project Screen
    func didCreateProject(_ project: CrochetProject) {
        //add the new project to the list of projects
        print("🏷 didCreateProject received:", project)  
        projects.append(project)
        //reload the table view so it updates and shows the new project
        tableView.reloadData()
    }

    // Connected a UITableView from storyboard to my code
    @IBOutlet weak var tableView: UITableView!
    
    //array of test projects and rownumbers
    var projects: [CrochetProject] = [
        CrochetProject(name: "Scarf", currentRow: 5),
        CrochetProject(name: "Blanket", currentRow: 12),
        CrochetProject(name: "Hat", currentRow: 2)
    ]


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Set the table view's data source and delegate to this view controller
                tableView.dataSource = self
                tableView.delegate = self
    }
    
    /* Tells the table how many rows to show
     returns number of porjects(each project becomes one row)
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }

    /* Creates the content for each row (aka cell)
     Reuses cells for performance (dequeueReusableCell)
     Fills in project name and row number
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath)
        let project = projects[indexPath.row]
        cell.textLabel?.text = "\(project.name) — Row \(project.currentRow)"
        return cell
    }
    
    /*
     If the screen we’re navigating to is a RowTrackerViewController, save it as destinationVC so we can pass data to it
     segue.destination This is the screen we're going to (in this case, the Row Tracker screen)
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRowTracker" {
            let destinationVC = segue.destination as? RowTrackerViewController
            if let indexPath = tableView.indexPathForSelectedRow { //Asks the table view: “Hey, which row was tapped?”
                let selectedProject = projects[indexPath.row] //Grabs the correct project from your array
                destinationVC?.currentProject = selectedProject
            }
            
        }
        else if segue.identifier == "createProject" {
            print("▶️ prepare: createProject segue fired")                  // 🔍
               let destinationVC = segue.destination as? CreateProjectViewController
               destinationVC?.delegate = self
            print("   delegate set to self:", destinationVC?.delegate as Any) // 
           }
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

