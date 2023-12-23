//
//  Anasayfa.swift
//  NotlarimUygulamasi
//
//  Created by Gizemnur Özden on 17.12.2023.
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

}
