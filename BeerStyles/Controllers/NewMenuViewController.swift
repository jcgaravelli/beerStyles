//
//  NewMenuViewController.swift
//  BeerStyles
//
//  Created by Paulo César Morandi Massuci on 20/07/15.
//
//

import UIKit

class NewMenuViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate{
    
    let reuseIdentifier = "cellMenu"
    var imagesMenu : [String] = ["stylesIcon","howIcon","glassIcon","foodIcon"]
    var screenSize : CGRect!
    var screenWidth : CGFloat!
    var screenHeight : CGFloat!

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
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            println("Op 0")
           performSegueWithIdentifier("ShowCategories", sender: nil)
            
            println("Op 0")
        case 1:
            performSegueWithIdentifier("ShowTutorial", sender: nil)
            println("Op 1")
        case 2:
            performSegueWithIdentifier("ShowGlasses", sender: nil)
            println("Op 2")
        case 3:
            performSegueWithIdentifier("ShowFoods", sender: nil)
            println("Op 3")
        default:
            break
        }

    }
    
    // MARK: - CollectionViewFlowLayout
    
    //  da o tamanho do icones na tela
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
       
        
        if indexPath.row == 0{
        
            return CGSize(width: screenWidth*0.70, height: screenWidth*0.7)
        }else{

        return CGSize(width: screenWidth*0.30, height: screenWidth*0.30)
        }
        
    }

//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        let picDimension = self.view.frame.size.width / 4.0
//        return CGSizeMake(picDimension, picDimension)
//    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        let leftRightInset = self.view.frame.size.width / 60
        
        
        var center = screenHeight/2 - screenWidth*0.60
        println(center)
        return UIEdgeInsetsMake(center, leftRightInset, 0, leftRightInset)
    }
   


}
