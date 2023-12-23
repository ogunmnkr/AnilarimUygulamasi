//
//  Hesap.swift
//  NotlarimUygulamasi
//
//  Created by Gizemnur Özden on 17.12.2023.
//

import UIKit
import Firebase

class Hesap: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Hesaptan çıkış yapmak için çıkış butonu
    @IBAction func buttonCikis(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toViewController", sender: nil)
        }catch {
            print("error")
        }
        
        
    }
    
}
