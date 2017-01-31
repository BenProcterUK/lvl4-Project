//
//  HouseTableViewController.swift
//  HousePin
//
//  Created by Ben Procter on 31/01/2017.
//  Copyright © 2017 Ben Procter. All rights reserved.
//

import UIKit

class HouseTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return houseNames.count
    }
    
    var houseNames = ["Monteith Gardens", "Monteith Drive", "The Oval", "Stamperland Drive", "Stamperland Gardens", "Moray Drive", "Randolph Drive"]
    
    var voterIDs = ["Labour", "Tory", "Non-Voter", "SNP", "SNP", "Independent"]
    var familynames = ["Dugdale", "Smith", "Jones", "Campbell", "Stuart", "Davidson"]

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HouseTableViewCell
        
        cell.streetnameLabel.text = houseNames[indexPath.row]
       // cell.familynameLabel?.text = familynames[indexPath.row]
      //  cell.voterIDLabel.text = voterIDs[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: "house.jpg")

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Create a series of options as an action pop up
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do", preferredStyle: .actionSheet)
        
        //Add actions to the action sheet menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        //Add call action
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavaliable", message: "Sorry, the call feature is not yet avaliable. Please try again later", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        }
        
        let callAction = UIAlertAction(title: "Call " + "01418383773", style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        //Add house checkin action
        let checkInAction = UIAlertAction(title: "Mark as Visited", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
        })
        optionMenu.addAction(checkInAction)
        
        //to be updated
        //let updateVoterID = UIAlertAction(title: "Update Voter ID", style: .cancel, handler: nil)
       // optionMenu.addAction(updateVoterID)
        
        //Display the menu
        present(optionMenu, animated: true, completion: nil)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
