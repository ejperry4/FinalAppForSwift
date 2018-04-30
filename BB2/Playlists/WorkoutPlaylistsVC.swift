//
//  WorkoutPlaylistsVC.swift
//  BB2
//
//  Created by Ej Perry on 4/28/18.
//  Copyright © 2018 Perry. All rights reserved.
//

import UIKit

class WorkoutPlaylistsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var alertNameTextField: UITextField?
    var numberOfRows = 0
    var rowsArray = [String]()
    var playListArray = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }


    @IBAction func addPlaylistPressed(_ sender: UIBarButtonItem) {
        showAlert(title: "New Playlist", message: "Name")
    }
    @IBAction func  unwindFromNameOfPlaylistVC (segue: UIStoryboardSegue) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlaylistToNamePlaylist" {
            //let destination = segue.destination as! NameOfPlaylistVC
            //let selectedIndex = tableView.indexPathForSelectedRow!
            
        }
    }
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField(configurationHandler: alertNameTextField)
        let defaultAction = UIAlertAction(title:"Ok", style: .default, handler: self.okHandler)
        //let cancelAction = (UIAlertAction(title:"Cancel", style: .cancel, handler: nil)
            
        alertController.addAction(defaultAction)
        //alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
        alertNameTextField(textField: alertNameTextField)

    }
    func alertNameTextField(textField: UITextField!) {
        alertNameTextField = textField
        alertNameTextField?.placeholder = ""

    }
    func okHandler(alert: UIAlertAction!) {
        
        rowsArray.append((alertNameTextField?.text)!)
        numberOfRows = numberOfRows + 1
        print(numberOfRows)
        print(rowsArray)
        tableView.reloadData()
    }
}
extension WorkoutPlaylistsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutCell", for: indexPath)
            cell.textLabel?.text = rowsArray[indexPath.row]
        return cell
        
    }
    @IBAction func unwindFromDrillVC (segue: UIStoryboardSegue) {
        
    }

}

