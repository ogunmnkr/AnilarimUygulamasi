//
//  Anasayfa.swift
//  NotlarimUygulamasi
//
//   Created by Gizemnur Özden & Ogün Minkara 
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var imageAniEkle: UIImageView!
    @IBOutlet weak var imageAnilarim: UIImageView!
    @IBOutlet weak var imageHarita: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//ani ekle tıklanabilirlik yapıldı.
        
        imageAniEkle.isUserInteractionEnabled = true
        let aniEkleTiklama = UITapGestureRecognizer(target: self, action: #selector(aniEkleGecis))
        imageAniEkle.addGestureRecognizer(aniEkleTiklama)
        
// Anilarim tıklanabilirlik ve geçiş yapıldı.
        
       imageAnilarim.isUserInteractionEnabled = true
       let anilarimTiklama = UITapGestureRecognizer(target: self, action: #selector(anilarimGecis))
       imageAnilarim.addGestureRecognizer(anilarimTiklama)
        
// harita resminin tıklanabilir olması için gereken işlemler ;
// imageHarita , haritaGecis fonksiyonları eklendi.
        
        imageHarita.isUserInteractionEnabled = true
        let haritaTiklama = UITapGestureRecognizer(target: self, action: #selector(haritaGecis))
        imageHarita.addGestureRecognizer(haritaTiklama)
    }
    
    @objc func haritaGecis() {
        
        performSegue(withIdentifier: "haritamGecis", sender: nil)
    
    }
   
    @objc func aniEkleGecis() {
        performSegue(withIdentifier: "toAniEkleVC", sender: nil)
    }
    
    @objc func anilarimGecis() {
     performSegue(withIdentifier: "toAnilarimVC", sender: nil)
 }

}
