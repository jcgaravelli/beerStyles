//
//  NewMenuViewController.swift
//  BeerStyles
//
//  Created by Paulo César Morandi Massuci on 20/07/15.
//
//

import UIKit

class NewMenuViewController: UIViewController, Storyboarded {
    private enum Constants {
        static let alpha: CGFloat = 0.01
    }
    
    @IBOutlet private weak var tableView: UITableView?
    @IBOutlet private weak var searchBar: UISearchBar?
    @IBOutlet private weak var barraInf: UIImageView?
    @IBOutlet private weak var barraSup: UIImageView?
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var layoutMenu: UICollectionViewLayout?
    private var searchList: [Int] = []
    private var menuItems: [MenuItemModel] = []
    
    static func instatiate(menuItems: [MenuItemModel]) -> NewMenuViewController {
        let menuViewController: NewMenuViewController = UIStoryboard.viewController(from: .menu)
        menuViewController.menuItems = menuItems
        
        return menuViewController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIView.animate(withDuration: 0.75, animations: { () -> Void in
            UIView.setAnimationCurve(UIView.AnimationCurve.easeInOut)
            UIView.setAnimationTransition(UIView.AnimationTransition.flipFromLeft, for: self.navigationController!.view, cache: false)
        })
    }
    
    private func setupView() {
        searchBar?.delegate = self
        tableView?.isHidden = true
        collectionView.isHidden = false
        collectionView.reloadData()
        searchBar?.transform = CGAffineTransform(translationX: 300, y: 0)
        searchBar?.alpha = Constants.alpha
        barraInf?.alpha = Constants.alpha
        barraSup?.alpha = Constants.alpha
    }
}

extension NewMenuViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    //numberOfSectionsInCollectionView: Retorna o numero total de secoes
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellMenu", for: indexPath) as! MenuCollectionViewCell
        cell.imageMenu.image = UIImage(named: menuItems[indexPath.row].imageItem)
        
        switch indexPath.row
        {
        case 0:
            UIView.animate(withDuration: 1.0, animations: {
                cell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                cell.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })
        case 1:
            
            
            UIView.animate(withDuration: 1.4, animations: {
                cell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                cell.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                
                self.searchBar?.transform = CGAffineTransform(translationX: 0, y: 0)
                self.searchBar?.alpha = 1.0
            })
        case 2:
            
            UIView.animate(withDuration: 1.8, animations: {
                cell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                cell.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })
        case 3:
            
            UIView.animate(withDuration: 2.2, animations: {
                cell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                cell.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                
                
                self.barraInf?.alpha = 1.0
                self.barraSup?.alpha = 1.0
            })
            
        default:
            break
        }
        
        return cell
        
    }
    
    // MARK: - CollectionViewFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenSize = self.view.frame
        let screenWidth = screenSize.width
        
        if indexPath.row == 0{
            
            return CGSize(width: screenWidth * 0.90, height: screenWidth * 0.8)
        }else{
            
            return CGSize(width: screenWidth * 0.30, height: screenWidth * 0.28)
        }
    }
    
    // posicionamento das células
    
    
    
}

extension NewMenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let screenSize = self.view.frame
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let leftRightInset = self.view.frame.size.width / 60
        
        let center = screenHeight / 2.3 - screenWidth * 0.60
        return UIEdgeInsets.init(top: center, left: leftRightInset, bottom: 0, right: leftRightInset)
    }
    
}

extension NewMenuViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let indexItens = ["ShowCategories", "ShowTutorial", "ShowGlasses", "ShowFoods" ]
        performSegue(withIdentifier: indexItens[indexPath.row] , sender: nil)
    }
}

extension NewMenuViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        collectionView.isHidden = true
        tableView?.reloadData()
        tableView?.isHidden = false
        barraInf?.isHidden =  true
        barraSup?.isHidden = true
    }
    
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
        barraInf?.alpha = 1.0
        barraSup?.alpha = 1.0
    }
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = String()
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        // Clear any search criteria
        searchBar.text = String()
        
        // Dismiss the keyboard
        searchBar.resignFirstResponder()
        collectionView.isHidden = false
        tableView?.isHidden = true
        barraInf?.isHidden =  false
        barraSup?.isHidden = false
        
        // Force reload of table data
        //        self.loadObjectsInBackground()
        
        //recarrega animações
        searchBar.showsCancelButton = false
        collectionView.reloadData()
    }
    
}

extension NewMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueSearch", sender: indexPath)
    }
}

extension NewMenuViewController: UITableViewDataSource {
    //MARK: -  TableViewDelgate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //cria as células-resultado na tabela de busca
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchTableViewCell
        //        let obj: PFObject = searchList.object(at: indexPath.row) as! PFObject
        //        cell.searchLabel.text = (obj["name"] as! String)
        
        return cell
    }
    
}
