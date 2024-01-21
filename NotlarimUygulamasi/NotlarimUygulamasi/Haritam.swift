//
//  Haritam.swift
//  NotlarimUygulamasi
//
//  Created by Gizemnur Özden & Ogün Minkara 
//

import UIKit
import MapKit
import Firebase
/* Haritam sayfasında kullanıcının ana ekrandan erişebileceği harita seçeneğinin
detayları yazılıcak. Harita açıldığında dünya haritası gibi açılmalı ki tüm noktalar
 görünsün o yüzden herhangi bir yakınlaştırıcı eklemedim */
class Haritam: UIViewController , MKMapViewDelegate{
    
    @IBOutlet weak var mapKit: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
// back butonu eklendi
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "<Back", style: .plain, target: self, action: #selector(backButton))
        
        mapKit.delegate = self
        
    }
    
    
    func getFromFirebase() {
        
        let aniEkleModel = AniEkleModel.sharedIntance
        let firestoreDatabase = Firestore.firestore()
        
        var firestoreReference : DocumentReference? = nil
        let firestoreAni = [ "secilenEnlem" : aniEkleModel.secilenEnlem , "secilenBoylam" : aniEkleModel.secilenBoylam, ] as [String: Any]
        
        
    }
    
    
    
    
    
    @objc func backButton () {
        self.dismiss(animated: true, completion: nil)
    }
}
