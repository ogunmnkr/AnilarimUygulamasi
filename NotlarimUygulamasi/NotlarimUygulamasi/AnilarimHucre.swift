//
//  AnilarimHucre.swift
//  NotlarimUygulamasi
//
//  Created by Gizemnur Özden on 24.12.2023.
//

import UIKit

class AnilarimHucre: UITableViewCell {

    //Tableviewde hücre görüntüsü için açıldı.
    @IBOutlet weak var imageViewSecilen: UIImageView!
    
    @IBOutlet weak var aniBaslikLabel: UILabel!
    
    @IBOutlet weak var tarihVeSaatLabel: UILabel!
    
    @IBOutlet weak var hucreArkaPlan: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
