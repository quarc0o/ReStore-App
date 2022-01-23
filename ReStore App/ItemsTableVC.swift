//
//  ItemsTableVC.swift
//  ReStore App
//
//  Created by Emmanuel Quarcoo on 25/11/2021.
//

import UIKit
import FirebaseFirestore

class ItemsTableVC: UITableViewController {
    //Firebase firestore setup
    let db = Firestore.firestore()
    var ref: DocumentReference? = nil
    
    var itemsArray = [String]()
    
    var ItemClassArray = [Items]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ItemClassArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemsCell
        
        cell.setUpCell(someItem: ItemClassArray[indexPath.row])
        
        cell.itemsNameLbl.text = ItemClassArray[indexPath.row].name
        return cell
    }
    
    
    func loadItems() {
        db.collection("Quantities").getDocuments { snap, err in
            if let err = err {
                print("Error")
            } else {
                for doc in snap!.documents {
                    let itemName = doc.documentID
                    //let itemCount = doc.data()["num"] as! Int
                    let someItem = Items(name: itemName, count: 0)
                    self.ItemClassArray.append(someItem)
                }
                self.tableView.reloadData()
            }
        }
    }
    
}
