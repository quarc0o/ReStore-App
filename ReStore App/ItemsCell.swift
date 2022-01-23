//
//  ItemsCell.swift
//  ReStore App
//
//  Created by Emmanuel Quarcoo on 25/11/2021.
//

import UIKit
import FirebaseFirestore

class ItemsCell: UITableViewCell {
    var currentItemNum = 0
    
    //Firebase firestore setup
    let db = Firestore.firestore()
    var ref: DocumentReference? = nil
    
    @IBOutlet weak var itemNumTxt: UITextField!
    @IBOutlet weak var itemsNameLbl: UILabel!
    
    func setUpCell(someItem: Items) {
        itemNumTxt.text = "\(someItem.count)"
    }
    
    @IBAction func itemIncrementBtn(_ sender: Any) {
        currentItemNum += 1
        itemNumTxt.text = "\(currentItemNum)"
    }
    @IBAction func itemDecrementBtn(_ sender: Any) {
        currentItemNum -= 1
        itemNumTxt.text = "\(currentItemNum)"
    }
}
