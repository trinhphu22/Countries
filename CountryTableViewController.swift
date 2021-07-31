//
//  CountryTableViewController.swift
//  Countries
//
//  Created by Forly on 24/07/2021.
//

import UIKit

class CountryTableViewController: UITableViewController {
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        let tableViewEditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    
    
    var countries: [Country] = [
        Country(flag: "🇨🇦", name: "Canada", region: "North America", population: "36.3m"),
        Country(flag: "🇦🇺", name: "Australia", region: "Oceania", population: "24.13m"),
        Country(flag: "🇨🇳", name: "China", region: "East Asia", population: "1.379b"),
        Country(flag: "🇮🇳", name: "India", region: "South Asia", population: "1.324b"),
        Country(flag: "🇩🇪", name: "Germany", region: "Central Europe", population: "89.19m"),
        Country(flag: "🇫🇷", name: "France", region: "West Europe", population: "67.41m"),
        Country(flag: "🇯🇵", name: "Japan", region: "East Asia", population: "125.47m"),
        Country(flag: "🇦🇷", name: "Argentina", region: "South America", population: "44.93m"),
        Country(flag: "🇧🇷", name: "Brazil", region: "South America", population: "210.14m"),
        Country(flag: "🇨🇱", name: "Chile", region: "South America", population: "17.91m"),
        Country(flag: "🇨🇴", name: "Columbia", region: "South America", population: "48.65m"),
        Country(flag: "🇩🇰", name: "Denmark", region: "North Europe", population: "5.84m"),
        Country(flag: "🇭🇺", name: "Hungary", region: "Central Europe", population: "9.7m"),
        Country(flag: "🇮🇩", name: "Indonesia", region: "South Asia", population: "270.20m"),
        Country(flag: "🇳🇿", name: "New Zealand", region: "Oceania", population: "4.69m"),
        Country(flag: "🇵🇹", name: "Portugal", region: "South Western Europe", population: "10.29m"),
        Country(flag: "🇷🇺", name: "Russia", region: "East Europe", population: "146.17m"),
        Country(flag: "🇻🇳", name: "Vietnam", region: "South Asia", population: "96.20m"),
        Country(flag: "🇨🇦", name: "Canada", region: "North America", population: "36.3m"),
        Country(flag: "🇦🇺", name: "Australia", region: "Oceania", population: "24.13m"),
        Country(flag: "🇨🇳", name: "China", region: "East Asia", population: "1.379b"),
        Country(flag: "🇮🇳", name: "India", region: "South Asia", population: "1.324b"),
        Country(flag: "🇩🇪", name: "Germany", region: "Central Europe", population: "89.19m"),
        Country(flag: "🇫🇷", name: "France", region: "West Europe", population: "67.41m"),
        Country(flag: "🇯🇵", name: "Japan", region: "East Asia", population: "125.47m"),
        Country(flag: "🇦🇷", name: "Argentina", region: "South America", population: "44.93m"),
        Country(flag: "🇧🇷", name: "Brazil", region: "South America", population: "210.14m"),
        Country(flag: "🇨🇱", name: "Chile", region: "South America", population: "17.91m"),
        Country(flag: "🇨🇴", name: "Columbia", region: "South America", population: "48.65m"),
        Country(flag: "🇩🇰", name: "Denmark", region: "North Europe", population: "5.84m"),
        Country(flag: "🇭🇺", name: "Hungary", region: "Central Europe", population: "9.7m"),
        Country(flag: "🇮🇩", name: "Indonesia", region: "South Asia", population: "270.20m"),
        Country(flag: "🇳🇿", name: "New Zealand", region: "Oceania", population: "4.69m"),
        Country(flag: "🇵🇹", name: "Portugal", region: "South Western Europe", population: "10.29m"),
        Country(flag: "🇷🇺", name: "Russia", region: "East Europe", population: "146.17m"),
        Country(flag: "🇻🇳", name: "Vietnam", region: "South Asia", population: "96.20m")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 44.0
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return countries.count
        } else {
            return 0
        }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableViewCell
        
        let country = countries[indexPath.row]
        cell.update(with: country)
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return.delete
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            countries.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let movedCountry = countries.remove(at: fromIndexPath.row)
        countries.insert(movedCountry, at: to.row)
        tableView.reloadData()
    }


    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    @IBAction func unwindToCountryTableView(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind",
              let sourceViewController = segue.source as? AddEditCountryTableViewController,
              let country = sourceViewController.country else {return}
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            countries[selectedIndexPath.row] = country
            tableView.reloadRows(at:[selectedIndexPath], with: .none)
        } else {
            let newIndexPath = IndexPath(row: countries.count, section: 0)
            countries.append(country)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditCountry" {
            let indexPath = tableView.indexPathForSelectedRow!
            let country = countries[indexPath.row]
            let navController = segue.destination as! UINavigationController
            let addEditCountryTableViewController = navController.topViewController as! AddEditCountryTableViewController
            addEditCountryTableViewController.country = country
        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
