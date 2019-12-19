//
//  ProteinsTableViewController.swift
//  SwiftyProteins
//
//  Created by Naledi MATUTOANE on 2019/12/10.
//  Copyright © 2019 Naledi MATUTOANE. All rights reserved.
//

import UIKit
import SceneKit

class ProteinsTableViewController: UITableViewController, UISearchResultsUpdating {
    var searchController: UISearchController!
    var data: [String] = Ligands.list
    var downloader: Downloader? = nil
    var name: String? = nil
    var model: SCNNode? = nil {
        didSet {
            if (model != oldValue) {
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "displayModel", sender: self)
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 40;
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        searchController.obscuresBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
        downloader = Downloader.init(view: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.destination is ModelViewController) {
            let vc = segue.destination as? ModelViewController
            vc?.model = self.model
            vc?.name = self.name
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searchController.isActive) {
            return data.count
        }
        else {
            return (Ligands.list.count)
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ligandCell", for: indexPath) as! ProteinTableViewCell
        
        if (searchController.isActive) {
            cell.ligand = data[indexPath.row]
            return cell
        }
        else {
            cell.ligand = Ligands.list[indexPath.row]
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? ProteinTableViewCell {
            if cell.isSelected {
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
                downloader!.load(URL: URL(string: "https://files.rcsb.org/ligands/download/\(cell.ligandName.text!)_ideal.pdb")!)
                self.name = cell.ligandName.text!
            }
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        data.removeAll(keepingCapacity: false)

        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (Ligands.list as NSArray).filtered(using: searchPredicate)
        data = array as! [String]

        self.tableView.reloadData()
    }
}
