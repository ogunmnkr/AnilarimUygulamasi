//
//  Haritam.swift
//  NotlarimUygulamasi
//
//  Created by Ogün Minkara on 22.12.2023.
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
        
        mapKit.delegate = self
        
    }
}
