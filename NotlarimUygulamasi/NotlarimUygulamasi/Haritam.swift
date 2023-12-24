//
//  Haritam.swift
//  NotlarimUygulamasi
//
//  Created by Gizemnur Özden & Ogün Minkara 
//

import UIKit
import MapKit
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
    @objc func backButton () {
        self.dismiss(animated: true, completion: nil)
    }
}
