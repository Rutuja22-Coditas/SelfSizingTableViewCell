//
//  TableViewCell.swift
//  basics
//
//  Created by Coditas on 15/03/22.
//

import UIKit

class TableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionVHt: NSLayoutConstraint!
    var check:Int = -1
   // var a = [["1","2"],["3","4","5"],["6"]]
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let width = (collectionView.frame.width-20)/3
                let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
                layout.itemSize = CGSize(width: width, height: width)
        
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //let index = a[section]
        if check >= 0 {
            let index = a[check]
            print("!!!!",index.count)
           // return index.count
        }
//        print(a[section].count)
       // return a.joined().count
        return a[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collCell", for: indexPath) as! CollectionViewCell
       
       // cell.lbl.text = a[collectionView.tag][indexPath.row]
        cell.lbl.text = "ok"
        return cell
    }
    
//    override func layoutSubviews() {
//        self.collectionVHt.constant = self.collectionView.collectionViewLayout.collectionViewContentSize.height
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        //collectionView.reloadData()
//        //return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height/2)
//        return CGSize(width: 350.0, height: 200.0)
//    }
//
////MARK:- collectionView delegate properties.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 5, bottom: 5, right: 5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }

}
