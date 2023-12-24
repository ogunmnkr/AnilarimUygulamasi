//
//  MapKitVC.swift
//  NotlarimUygulamasi
//
//   Created by Gizemnur Özden & Ogün Minkara 
//

import UIKit
import MapKit
import CoreLocation

//Ani ekle kısmının içindeki mapKit içindir.
// lokasyon yöneticisi ile kullanıcının bulunduğu konumda haritanın açılması
// için gerekli işlemler yapıldı.
    

class MapKitVC: UIViewController , MKMapViewDelegate , CLLocationManagerDelegate {
    

    @IBOutlet weak var aniEkleMap: MKMapView!
    var lokasyonYönetici = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aniEkleMap.delegate = self
        lokasyonYönetici.delegate = self
        lokasyonYönetici.desiredAccuracy = kCLLocationAccuracyBest // konum tahminini en iyi şekilde yapması için.
        lokasyonYönetici.requestWhenInUseAuthorization() // uygulamayı kullanırken konum isteme için.
        lokasyonYönetici.startUpdatingLocation()
        
        let jestAlgılayıcı = UILongPressGestureRecognizer(target: self, action: #selector(pinSecici(jestAlgilayici:)))
        jestAlgılayıcı.minimumPressDuration = 3
        aniEkleMap.addGestureRecognizer(jestAlgılayıcı)
        
        
// geri dönüş butonu eklendi.
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "<", style: .plain, target: self, action: #selector(geriİkonuTiklandi))
        
    }
// pin oluşturma için gerekli kodlar yazıldı.
    @objc func pinSecici(jestAlgilayici:UILongPressGestureRecognizer) {
        
        if jestAlgilayici.state == .began {
            
            let dokunulanNokta = jestAlgilayici.location(in: self.aniEkleMap)
            let dokunulanKoordinat = self.aniEkleMap.convert(dokunulanNokta, toCoordinateFrom: self.aniEkleMap)
            
            let pin = MKPointAnnotation()
            pin.coordinate = dokunulanKoordinat
            pin.title = "Seçilen Konum"
            self.aniEkleMap.addAnnotation(pin)
            
        }
       
    }
    
 // sürekli gelen güncel konum aşağıda dizi halinde verilmiştir.
// dizinin ilk elemanına göre enlem boylam işaretlemesi yaptım ;
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lokasyon = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        
// span özelliği ile haritanın zoom derecesini seçtim.
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: lokasyon, span: span)
        aniEkleMap.setRegion(region, animated: true)
        
        
    }
    
    @objc func geriİkonuTiklandi() {
        self.dismiss(animated: true)
    }
    

}
