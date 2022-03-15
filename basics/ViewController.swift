//
//  ViewController.swift
//  basics
//
//  Created by Coditas on 15/03/22.
//

import UIKit

var a = [["1","2","3","4"],["5","6"],["7","8","9","10","11","12"]]

protocol passIndex{
    
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        tableView.tableFooterView = UIView()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return a.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        //tableView.reloadRows(at: [indexPath], with: .automatic)
        cell.collectionView.tag = indexPath.section
        print(indexPath.section)
        cell.frame = tableView.bounds
        cell.layoutIfNeeded()

        cell.collectionVHt.constant = (cell.collectionView.collectionViewLayout.collectionViewContentSize.height)
        //print("@@@",cell.collectionView.contentSize.height)
        //cell.collectionView.reloadData()
        print(indexPath.row)
        //cell.check = indexPath.section
        cell.collectionView.reloadData()

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

