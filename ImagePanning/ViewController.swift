//
//  ViewController.swift
//  ImagePanning
//
//  Created by Geetika Shukla on 09/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var panImageView: UIImageView!
    @IBOutlet weak var superView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addImageView()
    }
    
    
    // addding image view and pan gesture recogniser to image view.
    func addImageView() {
        let ImageView = UIImageView(frame: CGRect(x: 100,y: 100,width: 50,height: 50))
        ImageView.image = UIImage.checkmark
        ImageView.contentMode = .scaleAspectFit
        ImageView.isUserInteractionEnabled = true
        self.view.addSubview(ImageView)
        let pan = UIPanGestureRecognizer(target: self, action: #selector(didTapPan))
        ImageView.addGestureRecognizer(pan)
        
    }
    
    
    //moving the image view back to center after user releases touch
    @objc func didTapPan(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        if let view = sender.view {
         view.center = CGPoint(x:view.center.x + translation.x,
                               y:view.center.y + translation.y)
       }
        sender.setTranslation(CGPoint(x: 0, y: 0), in: self.view)
        if sender.state == UIGestureRecognizer.State.ended {
            sender.view?.center = super.view.center
        }
    }

}

