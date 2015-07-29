//
//  NewMenuViewController.swift
//  BeerStyles
//
//  Created by Paulo César Morandi Massuci on 20/07/15.
//
//

import UIKit
import Parse
import ParseUI


class NewMenuViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate,  UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource{
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    let reuseIdentifier = "cellMenu"
    var imagesMenu : [String] = ["stylesIcon","howIcon","glassIcon","foodIcon"]
    var screenSize : CGRect!
    var screenWidth : CGFloat!
    var screenHeight : CGFloat!
    var searchList : NSArray!

    @IBOutlet weak var barraInf: UIImageView!
    @IBOutlet weak var barraSup: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        screenSize = self.view.frame
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        gradientColor()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        tableView.hidden = true
        collectionView.hidden = false
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    override func viewDidAppear(animated: Bool) {
        
        // Refresh the table to ensure any data changes are displayed
       // tableView.reloadData()
        
        // Delegate the search bar to this table view class
        searchBar.delegate = self
    }
    
    
    //CollectionViewDataSource : retorna informação sobre o numero de itens na collection view e em suas views.
    
    //numberOfItensInSection retorna o numero de celulas para serem motradas para uma determinada secao.No nosso caso mostrata o numero de copos que temos
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        println(imagesMenu.count)
        return imagesMenu.count
    }
    
    //numberOfSectionsInCollectionView: Retorna o numero total de secoes
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    
    
    
//    
//     cellForItemAtIndexPath: é responsavel por retornar  a celula e de dar o indexPath. Similar as celulas da tableView, as celulas da collection view são colocadas em  uma fila de reuso.
//    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellMenu", forIndexPath: indexPath) as! MenuCollectionViewCell
        
        
            cell.imageMenu.image = UIImage(named: imagesMenu[indexPath.row])
        
        return cell
        
    }
    
   // MARK: - CollectionViewDelegate
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.row
        {
        case 0:
            performSegueWithIdentifier("ShowCategories", sender: nil)
        case 1:
            performSegueWithIdentifier("ShowTutorial", sender: nil)
        case 2:
            performSegueWithIdentifier("ShowGlasses", sender: nil)
        case 3:
            performSegueWithIdentifier("ShowFoods", sender: nil)

        default:
            break
        }

    }
    
    // MARK: - CollectionViewFlowLayout
    
    //  da o tamanho do icones na tela
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
       
        // diferencia entre as rows para poder customizar tamanhos diferentes entre as células
        
        if indexPath.row == 0{
        
            return CGSize(width: screenWidth*0.90, height: screenWidth*0.8)
        }else{

        return CGSize(width: screenWidth*0.30, height: screenWidth*0.28)
        }
        
    }
    
    // posicionamento das células
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        let leftRightInset = self.view.frame.size.width / 60
        
        
        var center = screenHeight/2.3 - screenWidth*0.60
        println(center)
        return UIEdgeInsetsMake(center, leftRightInset, 0, leftRightInset)
    }
   
    
    
    
  //MARK: - Search Button
    
//    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
//        searchActive = true;
//    }
//    
//    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
//        searchActive = false;
//    }
//    
//    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
//        searchActive = false;
//    }
//    
//    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
//        searchActive = false;
//    }
    
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        collectionView.hidden = true
        tableView.hidden = false
        self.barraInf.hidden =  true
        self.barraSup.hidden = true
        
    }
    
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        
        // Dismiss the keyboard
        searchBar.resignFirstResponder()
        
    }
    
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        // Dismiss the keyboard
        searchBar.resignFirstResponder()
        loadObjectsInBackground()
        
    }
    
    // força que a busca dos objetos no parse rode background
    func loadObjectsInBackground() {
        var query = filterQuery(self.searchBar.text)
        
        query.findObjectsInBackgroundWithBlock { (list: [AnyObject]?, error: NSError?) -> Void in
            self.searchList = list;
            self.tableView.reloadData()
            return;
        }
    }
    
    // função do comportamento do botão
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        
        // Clear any search criteria
        searchBar.text = ""
        
        // Dismiss the keyboard
        searchBar.resignFirstResponder()
        collectionView.hidden = false
        tableView.hidden = true
        self.barraInf.hidden =  false
        self.barraSup.hidden = false

        
        // Force reload of table data
        self.loadObjectsInBackground()
    }
    
    //MARK: -  TableViewDelgate
    
    
    //retornos para a tableview da busca
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchList == nil) {
           return 0
        }
        return searchList.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    //cria as células-resultado na tabela de busca
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell =  tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SearchTableViewCell
        
        var obj: PFObject = searchList.objectAtIndex(indexPath.row) as! PFObject
    
        cell.searchLabel.text = (obj["name"] as! String)
        
        return cell
    }
    
    //MARK: - PARSE
    
    //função que filtra a busca de acordo com a database
    func filterQuery(search:NSString)->PFQuery{
        
        var query = PFQuery(className: "Style")
        
        // garante inidiferença entre lower e upper case na busca
        query.whereKey("lowercaseName", containsString: searchBar.text.lowercaseString)
        
        // Ordena o resultado
        query.orderByAscending("name")
        
        
        return query
    }
    
    //prepare for segue
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("segueSearch", sender: indexPath)
    }
    
    //segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueSearch"{
           if let destination = segue.destinationViewController  as? StyleDetailViewController{
            if let indexPath = tableView.indexPathForSelectedRow()?.row{
     
            
            
                let row = Int(indexPath)
                destination.currentObject = (searchList[row]) as! PFObject
            
            }
            
            }
            
            
        }
        
    }

}
