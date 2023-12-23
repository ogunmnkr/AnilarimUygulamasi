//
//  MapKitVC.swift
//  NotlarimUygulamasi
//
//  Created by Gizemnur Özden on 23.12.2023.
//

import UIKit

class MapKitVC: UIViewController {
//Ani ekle kısmının içindeki mapKit içindir.
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // geri dönüş butonu eklendi.
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "<", style: .plain, target: self, action: #selector(geriİkonuTiklandi))
    }
    
    @objc func geriİkonuTiklandi() {
        self.dismiss(animated: true)
    }
    

}
