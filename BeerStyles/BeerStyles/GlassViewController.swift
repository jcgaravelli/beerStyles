//
//  GlassViewController.swift
//  BeerStyles
//
//  Created by Paulo César Morandi Massuci on 16/07/15.
//
//

import UIKit
import Parse

class GlassViewController: UIViewController,  UICollectionViewDataSource, UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout{

    
    var glasses = [PFObject]()
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        gradientColor()
        
        let cellWidth = ((UIScreen.mainScreen().bounds.width) - 32 - 30 ) / 3
        let cellLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        cellLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)

    }
    override func viewDidAppear(animated: Bool) {
        loadCollectionViewData()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadCollectionViewData() {
        
        // Build a parse query object
        var query = PFQuery(className:"Glass")

        // Check to see if there is a search term
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            // The find succeeded now rocess the found objects into the countries array
            if error == nil {
                
                // Clear existing country data
                self.glasses.removeAll(keepCapacity: true)
                
                // Add country objects to our array
                if let objects = objects as? [PFObject] {
                    self.glasses = Array(objects.generate())
                }
                
                // reload our data into the collection view
                self.collectionView.reloadData()

            } else {
                // Log details of the failure
              
                //println("Error: \(error!) \(error!.userInfo!)")
            }
        }
 

}
    
    
    //CollectionViewDataSource : retorna informação sobre o numero de itens na collection view e em suas views.
    
    //numberOfItensInSection retorna o numero de celulas para serem motradas para uma determinada secao.No nosso caso mostrata o numero de copos que temos
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.glasses.count
    }
    
    //numberOfSectionsInCollectionView: Retorna o numero total de secoes
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
   // cellForItemAtIndexPath: é responsavel por retornar  a celula e de dar o indexPath. Similar as celulas da tableView, as celulas da collection view são colocadas em  uma fila de reuso.
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! GlassCollectionViewCell
        
        // Mostra nome do copo
        if let value = self.glasses[indexPath.row]["name"] as? String {
            cell.glassLabel.text = value
        } 
        
        // Mostrara a imagm do copo
        var initialThumbnail = UIImage(named: "name")
       // cell.glassImage.image = initialThumbnail
        
        // Fetch final flag image - if it exists
        if let value = glasses[indexPath.row]["flag"] as? PFFile {
            let finalImage = self.glasses[indexPath.row]["flag"] as? PFFile
            finalImage!.getDataInBackgroundWithBlock {
                (imageData: NSData?, error: NSError?) -> Void in
                if error == nil {
                    if let imageData = imageData {
                     //   cell.glassImage.image = UIImage(data:imageData)
                    }
                }
            }
        }
        return cell
    }
    
   //MARK – UICollectionViewDelegateFlowLayout

    
    // minimumInteritemSpacingForSectionAtIndex tamanho minimo entre as seções
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        var teste: CGFloat = -10
        return teste
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var algo:CGSize = CGSize(width: 150, height:150)
        
        return algo
        
    }
    
    
    /// CollectionViewDelegate é a notificaçao quando os eventos acontecem tais como as células a ser selecionado, destacads , ou removidas.
    //Fazendo Segue
    
    // didSelectItemAtIndexPath: mostra quando um item é selecionado
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let currentObject = glasses[indexPath.row]
        performSegueWithIdentifier("glassColectToDetails", sender: currentObject)
    }
    //MARK: - Navigation
   
    //passa os dados para a proxima tela
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // se a celula foi selecionada o currentObjact "setado˜
        var currentObject : PFObject?
        if let country = sender as? PFObject{
            currentObject = sender as? PFObject
        } else {
            // envia o objeto correspondente a classe do parse
            
            currentObject = PFObject(className:"Glass")
        }
        
        var detailScene = segue.destinationViewController as! GlassDetailViewController
        detailScene.currentObject = (currentObject)
    }

    
    
}
    