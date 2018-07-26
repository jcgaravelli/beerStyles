//
//  BackgroundEffect.swift
//  BeerStyles
//
//  Created by Matheus Santos Lopes on 03/08/15.
//
//

import Foundation
import MediaPlayer

extension UIViewController: UIWebViewDelegate {
    
    func playVideo() {
        let path = NSBundle.mainBundle().pathForResource("beer1", ofType: "gif")!
        let imageView = UIImageView(frame: view.frame)
        imageView.image = UIImage.animatedImageWithAnimatedGIFData(NSData(contentsOfFile: path))
        imageView.contentMode = .ScaleAspectFill
       

        imageView.frame = CGRect(x: 0.0, y: -145.0, width: self.view.frame.size.width, height: self.view.frame.size.height + 460.0)
        
        
        view.insertSubview(imageView, atIndex: 0)
    }
    
}






