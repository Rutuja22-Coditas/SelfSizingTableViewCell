//
//  ViewController.swift
//  basics
//
//  Created by Coditas on 15/03/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PassIndex {
    
    @IBOutlet weak var tableView: UITableView!

    var collectionData = [["1","2","3","4","5"],["5","6"],["7","8","9","10","11","12"],["13","14","15","1","2","3","4","1","2","3","4"],["7","8","9","10"],["23","22","21","25","26","27","28","29","30","31","32","34"],["7","8","9","10","11","12"],["13"],["14","15","16","19","23","22","21","25","26","27","28","29","30","31","32","34"]]
    
   // var collectionData = [CollectionData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        tableView.tableFooterView = UIView()
//        collectionData.append(CollectionData.init(singleArray: ["1","2","3","4","5"]))
//        collectionData.append(CollectionData.init(singleArray: ["1","2","3","4","5"]))
    }
    
    func deleteIndex(section: Int,item: Int) {
        collectionData[section].remove(at: item)
        //tableView.reloadRows(at: [IndexPath(item: item, section: 0)], with: .automatic)
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.delegate = self
        cell.frame = tableView.bounds
        
        let noOfRows = (collectionData[indexPath.row].count/4)
        let replace = collectionData[indexPath.row].count%4
        print(noOfRows)
//
//
        if replace == 0 {
            cell.collectionVHt.constant = CGFloat(Double(noOfRows)*100)
        }
        
        else{
            cell.collectionVHt.constant = CGFloat(Double(noOfRows+1) * 100)
        }
        //cell.collectionVHt.constant = CGFloat(Double(noOfRows) * 110)
//        for i in collectionData{
//            let a = (i.count/4)+1
//            print(CGFloat(Double(a) * 110.0))
//            cell.collectionVHt.constant = CGFloat(Double(a) * 110.0)
//            print("!!",cell.collectionVHt.constant)
//        }
       // cell.collectionVHt.constant = (cell.collectionView.collectionViewLayout.collectionViewContentSize.height)
        
        cell.index = collectionData[indexPath.row]
        //cell.index = collectionData[indexPath.row]
        cell.sectionValue = indexPath.row
        cell.collectionView.reloadData()
        cell.layoutIfNeeded()

        return cell
    }
    
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

