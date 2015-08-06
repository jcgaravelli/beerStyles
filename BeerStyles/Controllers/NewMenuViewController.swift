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
import MediaPlayer


class NewMenuViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource, UIWebViewDelegate{
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var barraInf: UIImageView!
    @IBOutlet weak var barraSup: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var layoutMenu: UICollectionViewLayout!
    var moviePlayer: MPMoviePlayerController!
    
    
    let reuseIdentifier = "cellMenu"
    
    var imagesMenu : [String] = ["stylesIcon","HowIcon","glassIcon","foodIcon"]
    var screenSize : CGRect!
    var screenWidth : CGFloat!
    var screenHeight : CGFloat!
    var searchList : NSArray!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //gradientColor()
       // playVideo()

//        // Load the video from the app bundle.
//        let videoURL: NSURL = NSBundle.mainBundle().URLForResource("beer1", withExtension: "mp4")!
//        
//        // Create and configure the movie player.
//        self.moviePlayer = MPMoviePlayerController(contentURL: videoURL)
//        
//        self.moviePlayer.controlStyle = MPMovieControlStyle.None
//        self.moviePlayer.scalingMode = MPMovieScalingMode.AspectFill
//        
//        self.moviePlayer.view.frame = self.view.frame
//        self.view .insertSubview(self.moviePlayer.view, atIndex: 0)
//        
//        
//        self.moviePlayer.play()
//        
//        // Loop video.
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loopVideo", name: MPMoviePlayerPlaybackDidFinishNotification, object: self.moviePlayer)
//    
//    
//    
//     
    

        
        
        screenSize = self.view.frame
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
       

        // Do any additional setup after loading the view.
    }
    
//    func loopVideo() {
//        self.moviePlayer.play()
//    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        tableView.hidden = true
        collectionView.hidden = false
        
        //recarrega animações
        collectionView.reloadData()
        self.searchBar.transform = CGAffineTransformMakeTranslation(300, 0)
        self.searchBar.alpha = 0.01
        self.barraInf.alpha = 0.01
        self.barraSup.alpha = 0.01

    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
        
       
            
            
//                let path = NSBundle.mainBundle().pathForResource("beerTorn", ofType: "gif")!
//                let imageView = UIImageView(frame: view.frame)
//                imageView.image = UIImage.animatedImageWithAnimatedGIFData(NSData(contentsOfFile: path))
//                imageView.contentMode = .ScaleAspectFill
//                
//                
//                imageView.frame = CGRect(x: 0.0, y: -145.0, width: self.view.frame.size.width, height: self.view.frame.size.height + 460.0)
//        
//                
//                view.insertSubview(imageView, atIndex: 0)
        
            
        
        
        
        
        UIView.animateWithDuration(0.75, animations: { () -> Void in
            UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
            UIView.setAnimationTransition(UIViewAnimationTransition.FlipFromLeft, forView: self.navigationController!.view, cache: false)
        })
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
    
        
        switch indexPath.row
        {
        case 0:
            UIView.animateWithDuration(1.0, animations: { //0.8
                cell.transform = CGAffineTransformMakeScale(0.5, 0.5)
                cell.transform = CGAffineTransformMakeScale(1.0, 1.0)
            })
        case 1:
            
  
            UIView.animateWithDuration(1.4, animations: { //1.2
                cell.transform = CGAffineTransformMakeScale(0.5, 0.5)
                cell.transform = CGAffineTransformMakeScale(1.0, 1.0)
                
                self.searchBar.transform = CGAffineTransformMakeTranslation(0, 0)
                self.searchBar.alpha = 1.0
            })
        case 2:

            UIView.animateWithDuration(1.8, animations: {
                cell.transform = CGAffineTransformMakeScale(0.5, 0.5)
                cell.transform = CGAffineTransformMakeScale(1.0, 1.0)
            })
        case 3:

            UIView.animateWithDuration(2.2, animations: {
                cell.transform = CGAffineTransformMakeScale(0.5, 0.5)
                cell.transform = CGAffineTransformMakeScale(1.0, 1.0)
        

                self.barraInf.alpha = 1.0
                self.barraSup.alpha = 1.0
            })
            
        default:
            break
        }

        return cell
        
    }
    
   // MARK: - CollectionViewDelegate
   // Define métodos que permitem gegenciar e destacar ítens da collectionview
    
    
    //verifica ítem selecionado
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
        searchBar.showsCancelButton = true
        collectionView.hidden = true
        tableView.reloadData()
        tableView.hidden = false
        self.barraInf.hidden =  true
        self.barraSup.hidden = true

        
    }
    
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
        self.barraInf.alpha = 1.0
        self.barraSup.alpha = 1.0
    }
    
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        searchBar.showsCancelButton = false
        searchBar.text = ""
        
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
        
        
        
        //recarrega animações
        
        searchBar.showsCancelButton = false
        
        
        collectionView.reloadData()
        

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
