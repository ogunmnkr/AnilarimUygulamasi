//
//  Notlarim.swift
//  NotlarimUygulamasi
//
//   Created by Gizemnur Özden & Ogün Minkara 
//

import UIKit
import Firebase
import FirebaseFirestore
import SDWebImage

class Anilarim: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    
    @IBOutlet weak var tableView: UITableView!
    
    var aniBaslikArray = [String()]
    var kullaniciFotoArray = [String()]
    var notArray = [String()]
    var tarihArray = [String()]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        getDataFromFirestore()
    }
    
    //DATABASE
    
    func getDataFromFirestore(){
        
        
        let fireStoreDatabase = Firestore.firestore()
        
        fireStoreDatabase.collection("Anilar").order(by: "date", descending: true).addSnapshotListener { (snapshot, error )in
            
            if error != nil {
                print(error?.localizedDescription)
            }else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    
                    self.aniBaslikArray.removeAll(keepingCapacity: false)
                    self.kullaniciFotoArray.removeAll(keepingCapacity: false)
                    self.tarihArray.removeAll(keepingCapacity: false)
                    self.notArray.removeAll(keepingCapacity: false)
                    
                    
                    
                    
                    for document in  snapshot!.documents {
                        let documentID = document.documentID
                        
                        if let aniBaslik = document.get("aniBaslik") as? String {
                            self.aniBaslikArray.append(aniBaslik)
                        }
                        
                        if let not = document.get("not") as? String {
                            self.notArray.append(not)
                        }
                        
                        if let imageUrl = document.get("imageUrl") as? String {
                            self.kullaniciFotoArray.append(imageUrl)
                        }
                        if let date = document.get("date") as? String {
                            self.tarihArray.append(date)
                        }
                    }
                    
                    self.tableView.reloadData()
                }
               
            }
        }
        
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aniBaslikArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "anilarHucre", for: indexPath) as! AnilarimHucre
       
    
        hucre.aniBaslikLabel.text = aniBaslikArray[indexPath.row]
        hucre.imageViewSecilen.sd_setImage(with: URL(string: self.kullaniciFotoArray[indexPath.row]))
        hucre.tarihVeSaatLabel.text = tarihArray[indexPath.row]
       
        return hucre
    }
}


