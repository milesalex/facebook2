//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Alex Miles on 3/2/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    var image: UIImage!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var lightboxTransition: LightboxTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 320, height: 569)
        
        lightboxTransition = LightboxTransition()
    }
    
    @IBAction func didPressDone(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        

    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("end")
        if scrollView.contentOffset.y < -50 || scrollView.contentOffset.y > 50 {
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    

}
