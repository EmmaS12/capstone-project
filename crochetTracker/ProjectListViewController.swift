//
//  ProjectListViewController.swift
//  crochetTracker
//
//  Created by Emma Saccone on 4/20/25.
//
import UIKit

class ProjectListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    // Connected to the Table View in Main.storyboard
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
    
    // Tells the table how many rows to show
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }

    // Creates the content for each row (aka cell)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath)
        let project = projects[indexPath.row]
        cell.textLabel?.text = "\(project.name) — Row \(project.currentRow)"
        return cell
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

