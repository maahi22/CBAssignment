//
//  HomeViewModel.swift
//  CodeBrewAssignment
//
//  Created by Maahi on 12/10/18.
//  Copyright © 2018 KTek. All rights reserved.
//

import UIKit

class HomeViewModel: NSObject {

    @IBOutlet private var homeClient:HomeClient!
    var homeData:HomeDataModel?
    
    
    func getHome(completion:@escaping(Bool,String)->())  {
        homeClient.getPickUpDate { [weak self] (homeData, message) in
            
            guard let strongSelf = self else{return}
            if let homeData = homeData{
                strongSelf.homeData = homeData
                
                completion(true,message)
            }else{
                completion(false,message)
            }
            
            
        }
        
    }
    
    
    
    func numberofCell() -> Int {
        
       
            guard let themes = homeData else { return 0 }
            return 3
        
    }
    
    
    
    
    func numberofPriSale() -> Int {
        guard let themes = homeData else { return 0 }
        guard let prisale = themes.data?.pre_sale else { return 0 }
        return prisale.count
        
    }
    
    
    func PriSaleAt(for cellAtIndex:IndexPath) -> pre_saleModel? {
        guard let themes = homeData else { return nil }
        guard let prisale = themes.data?.pre_sale else { return nil }
        //guard let pri = prisale else { return nil }
        return prisale[cellAtIndex.item]
    }
    
    
    
    func numberofPopularProjects() -> Int {
        guard let themes = homeData else { return 0 }
        guard let prisale = themes.data?.popular_projects else { return 0 }
        return prisale.count
        
    }
    
    func PopularProjectsAt(for cellAtIndex:IndexPath) -> popular_projectsModel? {
        guard let themes = homeData else { return nil }
        guard let prisale = themes.data?.popular_projects else { return nil }
        return prisale[cellAtIndex.item]
    }
    
    
    func numberofFeaturedLocalities() -> Int {
        guard let themes = homeData else { return 0 }
        guard let prisale = themes.data?.featured_localities else { return 0 }
        return prisale.count
        
    }
    
    func FeaturedLocalitiesAt(for cellAtIndex:IndexPath) -> featured_localitiesModel? {
        guard let themes = homeData else { return nil }
        guard let prisale = themes.data?.featured_localities else { return nil }
        return prisale[cellAtIndex.item]
    }
    
    
    /*func themesAt(for cellAtIndex:IndexPath) -> ThemeModel? {
        guard let themes = themesList else { return nil }
        return themes[cellAtIndex.item]
    }*/
    
}
