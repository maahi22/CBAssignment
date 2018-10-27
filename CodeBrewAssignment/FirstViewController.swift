//
//  FirstViewController.swift
//  CodeBrewAssignment
//
//  Created by Maahi on 12/10/18.
//  Copyright © 2018 KTek. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet private var homeViewModel:HomeViewModel!
    @IBOutlet weak var tableViewHome: UITableView!
    var storedOffsets = [Int: CGFloat]()
    
//    @IBOutlet private weak var collectionViewLayout: UICollectionViewFlowLayout!
//    private var indexOfCellBeforeDragging = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        collectionViewLayout.minimumLineSpacing = 0
        tableViewHome.register(HomeTableCell.nib, forCellReuseIdentifier: HomeTableCell.identifier)
        
        //self.tableViewHome.sectionHeaderHeight = 70
        
        homeViewModel.getHome {[weak self] (status, msg) in
            guard let strongSelf = self else{return}
            print("msg    \(msg)")
            if status {
            
            
            strongSelf.tableViewHome.reloadData()
            }else{
                showAlertMessage(vc: strongSelf, title: .Message, message: msg)
            }
        }
        
        
    }


}

extension FirstViewController{
    static func getStoryboardInstance() -> UINavigationController?{
        let storyborad = UIStoryboard(name: String(describing: self), bundle: nil)
        guard let navViewController = storyborad.instantiateInitialViewController()  as? UINavigationController else { return nil }
        return navViewController
    }
}


extension FirstViewController:UITableViewDataSource,UITableViewDelegate{
    
    
    
   
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //let headerView:UIView =  UIView()
        //headerView.backgroundColor = .red
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))

        
        let label = UILabel()
        label.frame = CGRect.init(x: 12, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)

        if section == 0 {
            label.text = "Pre-Sales "
        }else if section == 1{
            label.text = "Popular Projects"
        }else{
            label.text = "Featured Localities"
        }
        label.font = UIFont.boldSystemFont(ofSize: 25) // my custom font
        label.textColor = UIColor.black// my custom colour
        headerView.addSubview(label)
        
        return headerView
    }
        
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return homeViewModel.numberofCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heigh section: Int) -> CGFloat {
        return 50
    }
//
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
//        return 1
//    }
    
//     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Section \(section)"
//    }
//
//
//     func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let vw = UIView()
//        vw.backgroundColor = UIColor.red
//
//        return vw
//    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableCell.identifier, for: indexPath)  as? HomeTableCell else { return UITableViewCell() }
        //cell.dropShadow()
      
        
        return cell
    }

    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? HomeTableCell else { return }
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.section)
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.section] ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? HomeTableCell else { return }
        
        storedOffsets[indexPath.section] = tableViewCell.collectionViewOffset
    }
 
    
    
    
}


extension FirstViewController: UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel.numberofPriSale()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
      
        
       if collectionView.tag == 0{
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollCell.identifier, for: indexPath ) as? HomeCollCell else { return UICollectionViewCell() }
        cell.model = homeViewModel.PriSaleAt(for: indexPath)
        
        DispatchQueue.main.async { [weak self] in
            //guard let strongself = self else { return }
            cell.lblStart.layer.cornerRadius = cell.lblStart.frame.height * 0.5
        }
        
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell       .contentView.layer.cornerRadius).cgPath
        
        
        
        return cell
       }else if collectionView.tag == 1{
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollCell2.identifier, for: indexPath ) as? HomeCollCell2 else { return UICollectionViewCell() }
        cell.model = homeViewModel.PopularProjectsAt(for: indexPath)
        
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell       .contentView.layer.cornerRadius).cgPath
        
       return cell
       
       }else{
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollCell3.identifier, for: indexPath ) as? HomeCollCell3 else { return UICollectionViewCell() }
        cell.model = homeViewModel.FeaturedLocalitiesAt(for: indexPath)
        
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell       .contentView.layer.cornerRadius).cgPath
        
        
       return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellSize:CGSize!
        let width1 = SCREEN_SIZE.width - 60
        let height1 = collectionView.frame.size.height - 12.0
        
        cellSize = CGSize(width: width1, height:height1 )
        return cellSize
    }
    
    
    
    
   
    
    
}
