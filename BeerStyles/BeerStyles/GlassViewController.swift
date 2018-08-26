////
////  GlassViewController.swift
////  BeerStyles
////
////  Created by Paulo César Morandi Massuci on 16/07/15.
////
////
//
//
////EM CONSTRUÇÃO
//
//import UIKit
//import Parse
//
//class GlassViewController: UIViewController,  UICollectionViewDataSource, UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout{
//
//    
//    var glasses = [PFObject]()
//    @IBOutlet weak var collectionView: UICollectionView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        //gradientColor()
//        
//        let cellWidth = ((UIScreen.main.bounds.width) - 32 - 30 ) / 3
//        let cellLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        cellLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
//
//    }
//    override func viewDidAppear(_ animated: Bool) {
//        loadCollectionViewData()
//    }
//
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
////    func loadCollectionViewData() {
////        
////        // Build a parse query object
////        var query = PFQuery(className:"Glass")
////
////        // Check to see if there is a search term
////        query.findObjectsInBackground {
////            (objects: [AnyObject]?, error: NSError?) -> Void in
////            
////            // The find succeeded now rocess the found objects into the countries array
////            if error == nil {
////                
////                // Clear existing country data
////                self.glasses.removeAll(keepingCapacity: true)
////                
////                // Add country objects to our array
////                if let objects = objects as? [PFObject] {
////                    self.glasses = Array(objects.makeIterator())
////                }
////                
////                // reload our data into the collection view
////                self.collectionView.reloadData()
////
////            } else {
////                // Log details of the failure
////              
////                //println("Error: \(error!) \(error!.userInfo!)")
////            }
////        }
// 
//
//}
//    
//    
//    //CollectionViewDataSource : retorna informação sobre o numero de itens na collection view e em suas views.
//    
//    //numberOfItensInSection retorna o numero de celulas para serem motradas para uma determinada secao.No nosso caso mostrata o numero de copos que temos
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.glasses.count
//    }
//    
//    //numberOfSectionsInCollectionView: Retorna o numero total de secoes
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//   // cellForItemAtIndexPath: é responsavel por retornar  a celula e de dar o indexPath. Similar as celulas da tableView, as celulas da collection view são colocadas em  uma fila de reuso.
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GlassCollectionViewCell
//        
//        // Mostra nome do copo
//        if let value = self.glasses[indexPath.row]["name"] as? String {
//            cell.glassLabel.text = value
//        } 
//        
//        // Mostrara a imagm do copo
//        
//        if let iValue = self.glasses[indexPath.row]["imageGlasses"] as? String {
////            printf(iValue)
//            cell.glassImage.image = UIImage(named: iValue)
//            
//        }
//        
//        
//        
////        var initialThumbnail = UIImage(named: "imageGlasses")
////        cell.glassImage.image = initialThumbnail
//
////        // seta a imagem - sel ela existir
////        if let value = glasses[indexPath.row]["imageGlasses"] as? PFFile {
////            let finalImage = self.glasses[indexPath.row]["imageGlasses"] as? PFFile
////            finalImage!.getDataInBackgroundWithBlock {
////                (imageData: NSData?, error: NSError?) -> Void in
////                if error == nil {
////                    if let imageData = imageData {
////                       cell.glassImage.image = UIImage(data:imageData)
////                    }
////                }
////            }
////        }
////        
////        
//        
//        
//        
//        
//        
//        return cell
//    }
//    
//   //MARK – UICollectionViewDelegateFlowLayout
//
//    
//    // minimumInteritemSpacingForSectionAtIndex tamanho minimo entre as seções
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        let teste: CGFloat = -10
//        return teste
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let algo:CGSize = CGSize(width: 180, height:180)
//        
//        return algo
//        
//    }
//    
//    
//    /// CollectionViewDelegate é a notificaçao quando os eventos acontecem tais como as células a ser selecionado, destacads , ou removidas.
//    //Fazendo Segue
//    
//    // didSelectItemAtIndexPath: mostra quando um item é selecionado
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let currentObject = glasses[indexPath.row]
//        performSegue(withIdentifier: "glassColectToDetails", sender: currentObject)
//    }
//    //MARK: - Navigation
//   
//    //passa os dados para a proxima tela
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        // se a celula foi selecionada o currentObjact "setado˜
//        var currentObject : PFObject?
//        if let country = sender as? PFObject{
//            currentObject = sender as? PFObject
//        } else {
//            // envia o objeto correspondente a classe do parse
//            
//            currentObject = PFObject(className:"Glass")
//        }
//        
//        let detailScene = segue.destination as! GlassDetailViewController
//        detailScene.currentObject = (currentObject)
//    }
//    
//    
//}
//    
