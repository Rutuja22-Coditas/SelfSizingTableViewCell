//
//  TableViewCell.swift
//  basics
//
//  Created by Coditas on 15/03/22.
//

import UIKit

protocol PassIndex{
    func deleteIndex(section: Int,item: Int)
}
class TableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionVHt: NSLayoutConstraint!
    var index = [String]()
    var arrayForCollectionView = [[String]]()
    var delegate : PassIndex?
    var sectionValue = -1
   // var a = [["1","2"],["3","4","5"],["6"]]
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
//        let width = (collectionView.frame.width-20)/3
//        let height = (collectionView.frame.height - 20)/3
//                let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//                layout.itemSize = CGSize(width: width, height: height)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return index.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collCell", for: indexPath) as! CollectionViewCell
        cell.lbl.text = index[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        index.remove(at: indexPath.row)
        collectionView.deleteItems(at: [indexPath])
        delegate?.deleteIndex(section: sectionValue,item: indexPath.item)
        
        collectionView.reloadData()
        //var a = IndexPath(item: indexPath.row, section: index)
        
        //NotificationCenter.default.post(name: Notification.Name("notificationCenter"), object: nil)
//        if arrayForCollectionView[index].count == 0 || arrayForCollectionView[index].count <= 4{
//            NotificationCenter.default.post(name: Notification.Name("notificationCenter"), object: nil)
//        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        //collectionView.reloadData()
//        return CGSize(width: collectionView.frame.width/9, height: collectionView.frame.height/9)
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 5, bottom: 20, right: 20)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }

}
