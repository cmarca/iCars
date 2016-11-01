//
//  SideMenuViewController.swift
//  iCars-test
//
//  Created by Carlos Marcano on 10/30/16.
//  Copyright © 2016 Carlos Marcano. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {
    var flowDelegate: FlowManager?
    
    let cellReuseIdentifier: String = "cellReuseIdentifier"
    
    let citiesArray: [String]   = ["San Francisco",
                                   "New York"]
    let routesArray: [[String]]   = [["San Francisco", "New York"]]
    
    @IBOutlet weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        menuTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }
}


extension SideMenuViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? citiesArray.count : routesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as UITableViewCell
        if (indexPath.section == 0){
            cell.textLabel?.text = citiesArray[indexPath.row]
        } else if (indexPath.section == 1){
            cell.textLabel?.text = routesArray[indexPath.row][0] + " to " + routesArray[indexPath.row][1]
        }
        return cell
    }
    
}

extension SideMenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        flowDelegate?.closeMenu()
        switch indexPath.section {
        case 0:
            flowDelegate?.showCity(cityName: citiesArray[indexPath.row])
            break
        case 1:
            flowDelegate?.showRoute(from: routesArray[indexPath.row][0], to: routesArray[indexPath.row][1])
            break
        default:
            break
        }
    }
}
