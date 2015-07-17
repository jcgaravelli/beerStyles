//
//  CategotyViewController.swift
//  BeerStyles
//
//  Created by Paulo César Morandi Massuci on 16/07/15.
//
//

import UIKit
import Parse
import AVFoundation


class CategotyViewController: UIViewController {

    @IBOutlet weak var buttonAle: UIButton!
    var bubbleSound: SystemSoundID!
    
    let defaultDuration = 1.0
    let defaultDamping = 0.20
    let defaultVelocity = 0.5
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientColor()



        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func aleSelect(sender: AnyObject) {
        var object : PFObject = parseFind("Ale")
        
       // bubbleSound = createBubbleSound()
      //  animateButton()
        
        performSegueWithIdentifier("categoryToFather", sender: object)
        
  
    }
    
    @IBAction func lagerSelect(sender: AnyObject) {
        var object : PFObject = parseFind("Lager")
        performSegueWithIdentifier("categoryToFather", sender: object)
    }
    @IBAction func spontaneousSelect(sender: AnyObject) {
        var object : PFObject = parseFind("Spontaneous")
        performSegueWithIdentifier("categoryToFather", sender: object)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "categoryToFather" {
            if let destination = segue.destinationViewController as? FatherStyleViewController {
                
                destination.categoryObject = (sender as! PFObject)
                
                
              
            }
        }

    }
    
    
//
//    func animateButton() {
//        AudioServicesPlaySystemSound(bubbleSound)
//        buttonAle.transform = CGAffineTransformMakeScale(0.1, 0.10)
//        
//        UIView.animateWithDuration(defaultDuration,
//            delay: 1,
//            usingSpringWithDamping: CGFloat(defaultDamping),
//            initialSpringVelocity: CGFloat(defaultVelocity),
//            options: UIViewAnimationOptions.AllowUserInteraction,
//            animations: {
//                self.buttonAle.transform = CGAffineTransformIdentity
//            },
//            completion: { finished in
//                self.animateButton()
//            }
//        )
//    }
//    
//    
//    func createBubbleSound() -> SystemSoundID {
//        var soundID: SystemSoundID = 0
//        let soundURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), "bubble", "mp3", nil)
//        AudioServicesCreateSystemSoundID(soundURL, &soundID)
//        return soundID
//    }
    

    func parseFind(type:NSString)->PFObject{
        var query = PFQuery(className:"Category")
        query.whereKey("name", equalTo:type)
       var sender = query.getFirstObject()
        return sender!
    }
    
    
    
    func gradientColor(){
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [UIColor(red:1.0, green:0.85, blue:0.20, alpha:1.0).CGColor,UIColor(red:0.80, green:0.59, blue:0.00, alpha:1.0).CGColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        self.view.layer.insertSublayer(gradient, atIndex: 0)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
