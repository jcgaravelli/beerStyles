//
//  NewMenuViewController.swift
//  BeerStyles
//
//  Created by Paulo César Morandi Massuci on 20/07/15.
//
//
import UIKit
import MediaPlayer

let reuseIdentifier = "cellMenu"
let imagesMenu : [String] = ["stylesIcon","HowIcon","glassIcon","foodIcon"]

class NewMenuViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var barraInf: UIImageView!
    @IBOutlet weak var barraSup: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var layoutMenu: UICollectionViewLayout!
    var moviePlayer: MPMoviePlayerController!
    
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
    
        func loopVideo() {
            self.moviePlayer.play()
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        tableView.isHidden = true
        collectionView.isHidden = false
        
        //recarrega animações
        collectionView.reloadData()
        self.searchBar.transform = CGAffineTransform(translationX: 300, y: 0)
        self.searchBar.alpha = 0.01
        self.barraInf.alpha = 0.01
        self.barraSup.alpha = 0.01
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
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
        
        
        
        
        
        
        UIView.animate(withDuration: 0.75, animations: { () -> Void in
            UIView.setAnimationCurve(UIViewAnimationCurve.easeInOut)
            UIView.setAnimationTransition(UIViewAnimationTransition.flipFromLeft, for: self.navigationController!.view, cache: false)
        })
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // Refresh the table to ensure any data changes are displayed
        // tableView.reloadData()
        
        // Delegate the search bar to this table view class
        searchBar.delegate = self
    }
    
    
    
    
    //CollectionViewDataSource : retorna informação sobre o numero de itens na collection view e em suas views.
    
    //numberOfItensInSection retorna o numero de celulas para serem motradas para uma determinada secao.No nosso caso mostrata o numero de copos que temos
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        println(imagesMenu.count)
        return imagesMenu.count
    }
    
    //numberOfSectionsInCollectionView: Retorna o numero total de secoes
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    
    //
    //     cellForItemAtIndexPath: é responsavel por retornar  a celula e de dar o indexPath. Similar as celulas da tableView, as celulas da collection view são colocadas em  uma fila de reuso.
    //
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellMenu", for: indexPath) as! MenuCollectionViewCell
        cell.imageMenu.image = UIImage(named: imagesMenu[indexPath.row])
        
        
        switch indexPath.row
        {
        case 0:
            UIView.animate(withDuration: 1.0, animations: { //0.8
                cell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                cell.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })
        case 1:
            
            
            UIView.animate(withDuration: 1.4, animations: { //1.2
                cell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                cell.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                
                self.searchBar.transform = CGAffineTransform(translationX: 0, y: 0)
                self.searchBar.alpha = 1.0
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
                
                
                self.barraInf.alpha = 1.0
                self.barraSup.alpha = 1.0
            })
            
        default:
            break
        }
        
        return cell
        
    }
  
    // MARK: - CollectionViewFlowLayout
    
    //  da o tamanho do icones na tela
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // diferencia entre as rows para poder customizar tamanhos diferentes entre as células
        
        if indexPath.row == 0{
            
            return CGSize(width: screenWidth*0.90, height: screenWidth*0.8)
        }else{
            
            return CGSize(width: screenWidth*0.30, height: screenWidth*0.28)
        }
    }
    
    // posicionamento das células
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let leftRightInset = self.view.frame.size.width / 60
        
        
        var center = screenHeight/2.3 - screenWidth*0.60
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
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        collectionView.isHidden = true
        tableView.reloadData()
        tableView.isHidden = false
        self.barraInf.isHidden =  true
        self.barraSup.isHidden = true
        
        
    }
    
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
        self.barraInf.alpha = 1.0
        self.barraSup.alpha = 1.0
    }
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        // Dismiss the keyboard
        searchBar.resignFirstResponder()
        //        loadObjectsInBackground()
    }
    
    // força que a busca dos objetos no parse rode background
    //    func loadObjectsInBackground() {
    //        var query = filterQuery(self.searchBar.text as! NSString)
    //
    //        query.findObjectsInBackgroundWithBlock { (list: [AnyObject]?, error: NSError?) -> Void in
    //            self.searchList = list;
    //            self.tableView.reloadData()
    //            return;
    //            } as! PFArrayResultBlock as! PFArrayResultBlock as! PFArrayResultBlock as! PFArrayResultBlock as! PFArrayResultBlock
    //    }
    //
    // função do comportamento do botão
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        // Clear any search criteria
        searchBar.text = ""
        
        // Dismiss the keyboard
        searchBar.resignFirstResponder()
        collectionView.isHidden = false
        tableView.isHidden = true
        self.barraInf.isHidden =  false
        self.barraSup.isHidden = false
        
        // Force reload of table data
        //        self.loadObjectsInBackground()
        
        //recarrega animações
        searchBar.showsCancelButton = false
        collectionView.reloadData()
    }
    
    //MARK: -  TableViewDelgate
    
    
    //retornos para a tableview da busca
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchList == nil) {
            return 0
        }
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
    
    //MARK: - PARSE
    
    //função que filtra a busca de acordo com a database
//    func filterQuery(_ search:NSString)->PFQuery{
//
//        let query = PFQuery(className: "Style")
//
//        // garante inidiferença entre lower e upper case na busca
//        query.whereKey("lowercaseName", contains: searchBar.text?.lowercased())
//
//        // Ordena o resultado
//        query.order(byAscending: "name")
//
//
//        return query
//    }
    
    //prepare for segue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueSearch", sender: indexPath)
    }
    
    //segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueSearch"{
            if let destination = segue.destination  as? StyleDetailViewController{
                if let indexPath = tableView.indexPathForSelectedRow?.row{
                    let row = Int(indexPath)
//                    destination.currentObject = (searchList[row]) as! PFObject
                }
            }
        }
    }
}
extension NewMenuViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let indexItens = ["ShowCategories", "ShowTutorial", "ShowGlasses", "ShowFoods" ]
        performSegue(withIdentifier: indexItens[indexPath.row] , sender: nil)
    }
    
    
    
}

