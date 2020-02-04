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
        let path = Bundle.main.path(forResource: "beer1", ofType: "gif")!
        let imageView = UIImageView(frame: view.frame)
        imageView.image = UIImage.animatedImage(withAnimatedGIFData: try? Data(contentsOf: URL(fileURLWithPath: path)))
        imageView.contentMode = .scaleAspectFill
       

        imageView.frame = CGRect(x: 0.0, y: -145.0, width: self.view.frame.size.width, height: self.view.frame.size.height + 460.0)
        
        
        view.insertSubview(imageView, at: 0)
    }
}
