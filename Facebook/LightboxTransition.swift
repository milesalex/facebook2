//
//  LightboxTransition.swift
//  Facebook
//
//  Created by Alex Miles on 3/3/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class LightboxTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let newsFeedViewController = fromViewController as! NewsFeedViewController
        let photoViewController = toViewController as! PhotoViewController
        
        let movingImageView = UIImageView()
        
        let fromFrame = containerView.convertRect(newsFeedViewController.selectedImageView.frame, fromView: newsFeedViewController.selectedImageView.superview)
        
        var originalImageSize = CGSize(width: 320, height: 320 * (newsFeedViewController.selectedImageView.image?.size.height)! / (newsFeedViewController.selectedImageView.image?.size.width)!)
        
        var newFrame = CGRect(origin: CGPoint(x:0, y:(containerView.frame.height - originalImageSize.height) / 2), size: originalImageSize)
        
        movingImageView.frame = fromFrame
        movingImageView.image = newsFeedViewController.selectedImageView.image
        movingImageView.clipsToBounds = newsFeedViewController.selectedImageView.clipsToBounds
        movingImageView.contentMode = newsFeedViewController.selectedImageView.contentMode
        
        containerView.addSubview(movingImageView)
        
        photoViewController.imageView.alpha = 0
        newsFeedViewController.selectedImageView.alpha = 0
        
        toViewController.view.alpha = 0
        UIView.animateWithDuration(duration, animations: {
            let toFrame = containerView.convertRect(photoViewController.imageView.frame, fromView: photoViewController.imageView.superview)
            
            toViewController.view.alpha = 1
            movingImageView.frame = newFrame
            
        }) { (finished: Bool) -> Void in
            photoViewController.imageView.alpha = 1
            movingImageView.removeFromSuperview()
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let photoViewController = fromViewController as! PhotoViewController
        let newsFeedViewController = toViewController as! NewsFeedViewController
        
        let movingImageView = UIImageView()
        
        //let fromFrame = containerView.convertRect(photoViewController.imageView.frame, fromView: photoViewController.imageView.superview)
        
        var originalImageSize = CGSize(width: 320, height: 320 * (photoViewController.imageView.image?.size.height)! / (photoViewController.imageView.image?.size.width)!)
        
        var imagePositionY = ((containerView.frame.height - originalImageSize.height) / 2) - photoViewController.scrollView.contentOffset.y
        
        var newFrame = CGRect(origin: CGPoint(x:0, y:imagePositionY), size: originalImageSize)
        
        movingImageView.frame = newFrame
        movingImageView.image = photoViewController.imageView.image
        movingImageView.clipsToBounds = photoViewController.imageView.clipsToBounds
        movingImageView.contentMode = newsFeedViewController.selectedImageView.contentMode
        
        containerView.addSubview(movingImageView)
        
        photoViewController.imageView.alpha = 0
        newsFeedViewController.selectedImageView.alpha = 0
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            let toFrame = containerView.convertRect(newsFeedViewController.selectedImageView.frame, fromView: newsFeedViewController.selectedImageView.superview)
            
            fromViewController.view.alpha = 0
            movingImageView.frame = toFrame
        }) { (finished: Bool) -> Void in
            newsFeedViewController.selectedImageView.alpha = 1
            movingImageView.removeFromSuperview()
            self.finish()
        }
    }
    
}
