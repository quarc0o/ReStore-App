//
//  ViewController.swift
//  ReStore App
//
//  Created by Emmanuel Quarcoo on 20/11/2021.
//

import UIKit
import FirebaseFirestore
import FirebaseDatabase

class ViewController: UIViewController {
    
    var numItems = 0
    let db = Firestore.firestore()
    
    var ref: DocumentReference? = nil
    
    

    
    @IBOutlet weak var numItemsLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numItemsLbl.text = "\(numItems)"
    }
    
    
    @IBAction func plusBtnTapped(_ sender: Any) {
        numItems += 1
        numItemsLbl.text = "\(numItems)"
    }
    
    @IBAction func minsBtnTapped(_ sender: Any) {
        numItems -= 1
        numItemsLbl.text = "\(numItems)"
    }
    
    @IBAction func updateBtnTapped(_ sender: Any) {
        updateNumofItems(numOfItems: numItems)
    }
    
    func updateNumofItems(numOfItems: Int) {
        db.collection("Quantities").document("quant").setData([
            "First Item" : numOfItems])
    }
}

