//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Alex Miles on 3/2/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    var image: UIImage!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image
    }
    
    @IBAction func didPressDone(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}
