//
//  CategotyViewController.swift
//  BeerStyles
//
//  Created by Paulo César Morandi Massuci on 16/07/15.
//
//

import UIKit
import AVFoundation
import MediaPlayer



class CategotyViewController: UIViewController {
    
    @IBOutlet weak var buttonAle: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playVideo()
        
        //gradientColor()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
        UIView.animate(withDuration: 0.75, animations: { () -> Void in
            UIView.setAnimationCurve(UIView.AnimationCurve.easeInOut)
            UIView.setAnimationTransition(UIView.AnimationTransition.flipFromLeft, for: self.navigationController!.view, cache: false)
        })
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //BOTÕES DE CATEGORIA
    @IBAction func aleSelect(_ sender: AnyObject) {
        self.selectType("Ale")
    }
    
    @IBAction func lagerSelect(_ sender: AnyObject) {
        self.selectType("Lager")
    }
    
    @IBAction func spontaneousSelect(_ sender: AnyObject) {
        self.selectType("Spontaneous")
    }
    
    //Promise pra garantir que a a próxima será carregarada antes do segue
    
    func selectType(_ typeName: NSString) {
        //        var promise : BFTask = parseFind(typeName)
        //        promise.continue {
        //            (task: BFTask!) -> AnyObject in
        //            self.performSegue(withIdentifier: "categoryToFather", sender: promise.result)
        //            return promise.result
        //        }
        
    }
    
//    //segue
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "categoryToFather" {
//            if let destination = segue.destination as? FatherStyleViewController {
//
//                destination.categoryObject = (sender as! PFObject)
//
//
//
//            }
//        }
    
//    }
}
