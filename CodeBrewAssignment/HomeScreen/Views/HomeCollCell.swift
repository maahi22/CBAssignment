//
//  HomeCollCell.swift
//  CodeBrewAssignment
//
//  Created by Maahi on 12/10/18.
//  Copyright © 2018 KTek. All rights reserved.
//

import UIKit
import SDWebImage
import Alamofire


class HomeCollCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
   
    @IBOutlet weak var lblStart: UILabel!
    
    
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblType: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        DispatchQueue.main.async { [weak self] in
//            guard let strongself = self else { return }
//            strongself.lblStart.layer.cornerRadius = strongself.lblStart.frame.height * 0.5
//        }

    }

    static var identifier:String{
        return String(describing: self)
    }
    static var nib:UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    
      var model:pre_saleModel?{
        
        didSet{
            
           
            self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            
            guard let themes = model else { return  }
            let img = UIImage(named: "second")
            guard let imgUrl = themes.main_image else { return  }
            imageView.sd_setImage(with: URL(string: imgUrl), placeholderImage: img)
            
            guard let title = themes.name else { return  }
            self.lblTitle.text = title
            
            guard let price = themes.starting_price else { return  }
            lblPrice.text = "$\(price)K"
            
            //guard let price = themes.starting_price else { return  }
            lblType.text = "4 BHK"
            
        }
    }
}
