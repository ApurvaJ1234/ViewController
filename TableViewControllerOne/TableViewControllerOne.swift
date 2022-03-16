//
//  TableViewControllerOne.swift
//  TableViewControllerOne
//
//  Created by Coditas on 14/03/22.
//

import UIKit

class TableViewControllerOne: UITableViewController {
    
    public var models: [String] = [
    "One",
    "Two"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        return cell
    }

}
