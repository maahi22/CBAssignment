//
//  HomeCollCell2.swift
//  CodeBrewAssignment
//
//  Created by Maahi on 12/10/18.
//  Copyright © 2018 KTek. All rights reserved.
//

import UIKit

class HomeCollCell2: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lbltype: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
   
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    static var identifier:String{
        return String(describing: self)
    }
    static var nib:UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    
    var model:popular_projectsModel?{
        
        didSet{
            guard let themes = model else { return  }
            let img = UIImage(named: "second")
            guard let imgUrl = themes.main_image else { return  }
            imageView.sd_setImage(with: URL(string: imgUrl), placeholderImage: img)
            
            guard let title = themes.name else { return  }
            self.lblTitle.text = title
            
            
            guard let add = themes.address else { return  }
            self.lblAddress.text = add
            
            
            guard let price = themes.avg_price else { return  }
            lblPrice.text = "$\(price)K"
            
            lbltype.text = "4 BHK"
     
            
        }
    }
}
