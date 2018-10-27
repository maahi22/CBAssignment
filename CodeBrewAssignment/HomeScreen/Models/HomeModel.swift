//
//  HomeModel.swift
//  CodeBrewAssignment
//
//  Created by Maahi on 12/10/18.
//  Copyright © 2018 KTek. All rights reserved.
//

import Foundation


struct HomeDataModel:Codable {
    
    var success : String?
    var message : String?
    var data : dataModel?
    
}


struct  dataModel :Codable{
    
//    let recommended:[recommendedModel]
//    let top_developers:[top_developersModel]
    let pre_sale:[pre_saleModel]
    let popular_projects:[popular_projectsModel]
    let featured_localities:[featured_localitiesModel]
    let blogs:[blogsModel]
}

struct recommendedModel:Codable {
    let id:Int = 0
    let for_sale:Int = 0
    let for_rent:Int = 0
    let locality_id:Int = 0
    let city_id:Int = 0
    let configuration_id:Int = 0
    let property_type_id:Int = 0
    let expected_price_sale:String = ""
    let expected_price_rent:String = ""
    let image:String = ""
    let image_thumb:String = ""
    let area:String = ""
    let floor:String = ""
    let possesion_date:String = ""
    let bedroom:Int = 0
    let bathroom:Int = 0
    let description:String = ""
    let quantity:Int = 0
    let created_by:Int = 0
    let status:Int = 0
    let step:Int = 0
    let building_id:Int = 0
    let currency_id:Int = 0
    let parking:Int = 0
    let furnished:Int = 0
    let pets:Int = 0
    
    let floor_plan:String = ""
    let min_price:Int = 0
    let max_price:Int = 0
    let is_blocked:String = ""
    let property_url:String = ""
    let created_at:String = ""
    let updated_at:String = ""
    let max_area:Int = 0
    let is_favorite:Int = 0
    let city:cityModel
    let locality:localityModel
    let currency:String = ""
    let creator:creatorModel
    let images:[imagesModel]
    let custom_values:[custom_valuesModel]
    let building:buildingModel
    let amenities:[amenitiesModel]
    let carpet_areas:[carpet_areasModel]
    
}

struct cityModel:Codable {
    let id:Int = 0
    let state_id:Int = 0
    let name_en:String = ""
    let name_es:String = ""
    let status:Int = 0
    let name:String = ""
    //let configuration:configurationModel
}

struct localityModel:Codable {
    let id:Int = 0
    let name_en:String = ""
    let name_es:String = ""
    let city_id:Int = 0
    let poly_coordinates:String = ""
    let status:Int = 0
    let price_per_sqft:Int = 0
    let name:String = ""
}

struct configurationModel:Codable {
    let id:Int = 0
    let name_en:String = ""
    let name_es:String = ""
    let created_by:Int = 0
    let status:Int = 0
    let created_at:String = ""
    let updated_at:String = ""
    let name:String = ""
    let is_selected:Int = 0
}

struct property_typeModel:Codable {
    let id:Int = 0
    let name_en:String = ""
    let name_es:String = ""
    let created_by:Int = 0
    let status:Int = 0
    let created_at:String = ""
    let updated_at:String = ""
    let name:String = ""
    let is_selected:Int = 0
}

struct creatorModel:Codable {
    let id:Int = 0
    let name:String = ""
    let image:String = ""
    
}

struct imagesModel:Codable {
    let id:Int = 0
    let property_id:Int = 0
    let image:String = ""
    let image_thumb:String = ""
    let created_at:String = ""
    let updated_at:String = ""
}


struct custom_valuesModel:Codable {
    let id:Int = 0
    let property_id:Int = 0
    let name:String = ""
    let value:String = ""
    let created_at:String = ""
    let updated_at:String = ""
}

struct buildingModel:Codable {
    let id:Int = 0
    let name:String = ""
    let address:String = ""
    let locality_id:Int = 0
    let city_id:Int = 0
    let lat:Double = 0.0
    let lng:Double = 0.0
    let main_image:String = ""
    let admin_id:Int = 0
    let user_developer:Int = 0
    let created_by:Int = 0
    let status:Int = 0
    let building_age:String = ""
    let building_type_id:Int = 0
    let description:String = ""
    let possession_status_id:Int = 0
    let floors:Int = 0
    let avg_price:Int = 0
    let launch_date:String = ""
    let is_blocked:String = ""
    let project_url:String = ""
    
    let starting_price:Int = 0
    let banks:[banksModel]
    let configurations:[configurationsModel]
    let developer :developerModel
    let building_type:building_typeModel
}

struct carpet_areasModel:Codable {
    let id:Int = 0
    let property_id:Int = 0
    let area:Int = 0
    let price:Int = 0
    let created_at:String = ""
    let updated_at:String = ""
}





//2nd
struct top_developersModel:Codable {
    
    let id:Int = 0
    let name:String = ""
    let email:String = ""
    let country_code:String = ""
    let dial_code:String = ""
    let phone:String = ""
    let image:String = ""
    let is_buyer:String = ""
    let is_seller:Int = 0
    let seller_type:String = ""
    let developer_title:String = ""
    let developer_url:String = ""
    let developer_image:String = ""
    let developer_desc:String = ""
    let is_blocked:Int = 0
    let is_email_verified:String = ""
    let is_phone_verified:String = ""
    let assigned_csr_buyer_id:String = ""
    let assigned_csr_seller_id:String = ""
    let year_estd:String = ""
    let seller_assigned_on:String = ""
    let created_at:String = ""
    let updated_at:String = ""
    let rent_property_count:Int = 0
    let sale_property_count:Int = 0
    let buildings_count:Int = 0
    let approved_property_count:Int = 0
}



//3nd

struct pre_saleModel:Codable {
    let id:Int?
    let name:String?
    let address:String?
//    let locality_id:String?
//    let city_id:String?
//    let lat:Double?
//    let lng:Double?
    let main_image:String?
    let starting_price:Int?
    /*let admin_id:Int?
    let user_developer:Int?
    let created_by:Int?
    let status:Int?
    let building_age:Int?
    let building_type_id:Int?
    let description:String?
    let possession_status_id:Int?*/
    
    /*let floors:Int = 0
    let avg_price:Int = 0
    let launch_date:String = ""
    let is_blocked:String = ""
    let project_url:String = ""
    */
//    let banks:[banksModel]
//    let city:building_typeModel
//    let amenities:[amenitiesModel]
//    let configurations:[configurationsModel]
//    let developer:developerModel
}



struct popular_projectsModel:Codable {
    let id:Int = 0
    let name:String?
    let address:String?
    /*let locality_id:String = ""
    let city_id:String = ""
    let lat:String = ""
    let lng:String = ""*/
    let main_image:String?
    let avg_price:Int?
   /* let admin_id:String = ""
    let user_developer:String = ""
    let created_by:String = ""
    let status:String = ""
    let building_age:String = ""
    let building_type_id:String = ""
    let description:String = ""
    let possession_status_id:String = ""
    
    let floors:String = ""
    let avg_price:String = ""
    let launch_date:String = ""
    let is_blocked:String = ""
    let project_url:String = ""
    let starting_price:String = ""
    let banks:[banksModel]
    let city:building_typeModel
    let amenities:[amenitiesModel]
    let configurations:[configurationsModel]
    let developer:developerModel*/
}







struct banksModel:Codable{
    let id:Int = 0
    let name:String = ""
    let email:String = ""
    let address:String = ""
    let image:String = ""
    let country_code:String = ""
    let dial_code:String = ""
    let phone:String = ""
    let is_blocked:Int = 0
    let created_by:Int = 0
    let is_bank:Int = 0
    let is_noatary:String = ""
    let floating_int:String = ""
    let branch:String = ""
    let is_acl:Int = 0
    let created_at:String = ""
    let updated_at:String = ""
}

struct building_typeModel:Codable{
    let id:Int = 0
    let name_en:String = ""
    let name_es:String = ""
    let status:Int = 0
    let created_by:Int = 0
    let created_at:String = ""
    let updated_at:String = ""
    let name:String = ""
}

struct pivotModel:Codable{
    let building_id:Int = 0
    let amenity_id:Int = 0
}

struct amenitiesModel:Codable{
    let id:Int = 0
    let name_en:String = ""
    let name_es:String = ""
    let icon:String = ""
    let created_by:Int = 0
    let status:Int = 0
    let name:String = ""
    let pivot:pivotModel
}

struct configModel:Codable{
    let id:Int = 0
    let name_en:String = ""
    let name_es:String = ""
    let created_by:Int = 0
    let status:Int = 0
    let created_at:String = ""
    let updated_at:String = ""
    let name:String = ""
    let is_selected:Int = 0
}

struct configurationsModel:Codable{
    let id:Int = 0
    let building_id:Int = 0
    let configuration_id:Int = 0
    let floor_map_image:String = ""
    let carpet_area:Int = 0
    let created_by:String = ""
    let base_price:Int = 0
    let created_at:String = ""
    let updated_at:String = ""
    let config:configModel
    
}


struct developerModel:Codable{
    let id:Int = 0
    let name:String = ""
    let email:String = ""
    let country_code:String = ""
    let dial_code:String = ""
    let phone:String = ""
    let image:String = ""
    let is_buyer:String = ""
    let is_seller:Int = 0
    let seller_type:String = ""
    let developer_title:String = ""
    let developer_url:String = ""
    let developer_image:String = ""
    let developer_desc:String = ""
    let is_blocked:Int = 0
    let is_email_verified:String = ""
    let is_phone_verified:String = ""
    let assigned_csr_buyer_id:String = ""
    let assigned_csr_seller_id:String = ""
    let year_estd:String = ""
    let seller_assigned_on:String = ""
    let created_at:String = ""
    let updated_at:String = ""
    
}



//*****
struct featured_localitiesModel:Codable {
    let id:Int = 0
    let name_en:String = ""
    let name_es:String = ""
    let city_id:Int = 0
    let poly_coordinates:String = ""
    let status:Int = 0
    let price_per_sqft:Int?
    //let is_featured:Int = 0
    let buildings_count:Int?
    let name:String?
    
}

struct blogsModel:Codable {
    let id:Int = 0
    let title:String = ""
    let image:String = ""
    let description:String = ""
    let deleted_at:String = ""
    let updated_at:String = ""
    
}
