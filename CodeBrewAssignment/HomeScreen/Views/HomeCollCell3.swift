//
//  HomeCollCell3.swift
//  CodeBrewAssignment
//
//  Created by Maahi on 12/10/18.
//  Copyright © 2018 KTek. All rights reserved.
//

import UIKit

class HomeCollCell3: UICollectionViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblArea: UILabel!
    @IBOutlet weak var lblNoOfProject: UILabel!
    
    
    
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
    
    var model:featured_localitiesModel?{
        
        didSet{
            guard let themes = model else { return  }
            let img = UIImage(named: "second")
            
            
            guard let title = themes.name else { return  }
            self.lblName.text = title
            
            
            guard let price = themes.price_per_sqft else { return  }
            self.lblArea.text = "$ \(price) /Sqft"
            
            guard let count = themes.buildings_count else { return  }
            self.lblNoOfProject.text = "\(count)"
            
        }
    }
}
