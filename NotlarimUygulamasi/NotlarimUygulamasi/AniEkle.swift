//
//  AniEkle.swift
//  NotlarimUygulamasi
//
//  Created by Gizemnur Özden on 23.12.2023.
//

import UIKit
import MapKit

class AniEkle: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  
    @IBOutlet weak var imageViewFotoSec: UIImageView!
    
    @IBOutlet weak var aniBaslikText: UITextField!
    @IBOutlet weak var tarihSaatText: UITextField!
    @IBOutlet weak var notTextView: UITextView!
    @IBOutlet weak var mapKitView: MKMapView!
    
    var datePicker:UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //Fotoğraf seçin üstüne basılınca fotoğraf seçme yazıldı.
      //Albüme gidiş yazıldı.
        imageViewFotoSec.isUserInteractionEnabled = true
        let fotografSec = UITapGestureRecognizer(target: self, action: #selector(fotografSec))
        imageViewFotoSec.addGestureRecognizer(fotografSec)
        
        //NAvigation bar'a Save kısmı eklendi.
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "SAVE", style: .plain, target: self, action: #selector(saveButtonTiklandi))
        //navigatiın bar'a back buttonu eklendi
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "<Back", style: .plain, target: self, action: #selector(backButtonTiklandi))
        //mapkite tıklanınca geçiş yapıldı.
        mapKitView.isUserInteractionEnabled = true
        let mapKitSec = UITapGestureRecognizer(target: self, action: #selector(mapKitTiklandi))
        mapKitView.addGestureRecognizer(mapKitSec)
        
        
        //Tarih ve Saat seçme özellikleri eklendi.
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .dateAndTime
        tarihSaatText.inputView = datePicker
        
        if #available(iOS 13.4, *) {
            datePicker?.preferredDatePickerStyle = .wheels
        }
        
        
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(dokunmaAlgilamaMetod))
        view.addGestureRecognizer(dokunmaAlgilama)
        
        datePicker?.addTarget(self, action: #selector(tarihVeSaatGoster(uiDatePicker:)), for: .valueChanged)
        
    }
    
    @objc func dokunmaAlgilamaMetod() {
        view.endEditing(true)
    }
    @objc func tarihVeSaatGoster (uiDatePicker: UIDatePicker){
        let format = DateFormatter()
        format.dateFormat = "dd-MM-yyyy HH:mm"
        let alinanTarih = format.string(from: uiDatePicker.date)
        tarihSaatText.text = alinanTarih
    }
    

    @objc func fotografSec() {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageViewFotoSec.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }

    @objc func saveButtonTiklandi () {
        //kaydetme kodları gelecek
        self.dismiss(animated: true)
    }
    @objc func backButtonTiklandi () {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func mapKitTiklandi (){
        performSegue(withIdentifier: "toMapKitVC", sender: nil)
    }
}
