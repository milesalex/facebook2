//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedView: UIImageView!
    
    @IBOutlet weak var wedding1: UIImageView!
    @IBOutlet weak var wedding2: UIImageView!
    @IBOutlet weak var wedding3: UIImageView!
    @IBOutlet weak var wedding4: UIImageView!
    @IBOutlet weak var wedding5: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSizeMake(320, feedView.image!.size.height)
        
        let tapGesture1 =  UITapGestureRecognizer(target: self, action: "didTap:")
        let tapGesture2 =  UITapGestureRecognizer(target: self, action: "didTap:")
        let tapGesture3 =  UITapGestureRecognizer(target: self, action: "didTap:")
        let tapGesture4 =  UITapGestureRecognizer(target: self, action: "didTap:")
        let tapGesture5 =  UITapGestureRecognizer(target: self, action: "didTap:")
        
        wedding1.addGestureRecognizer(tapGesture1)
        wedding2.addGestureRecognizer(tapGesture2)
        wedding3.addGestureRecognizer(tapGesture3)
        wedding4.addGestureRecognizer(tapGesture4)
        wedding5.addGestureRecognizer(tapGesture5)

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    
    func didTap(gestureRecognizer: UIGestureRecognizer) {
        
        switch (gestureRecognizer.view) {
        case wedding1?:
            print("wedding1")
            performSegueWithIdentifier("photoDetailSegue", sender: self)
        case wedding2?:
            print("wedding2")
            performSegueWithIdentifier("photoDetailSegue", sender: self)
        case wedding3?:
            print("wedding3")
            performSegueWithIdentifier("photoDetailSegue", sender: self)
        case wedding4?:
            print("wedding4")
            performSegueWithIdentifier("photoDetailSegue", sender: self)
        case wedding5?:
            print("wedding5")
            performSegueWithIdentifier("photoDetailSegue", sender: self)
        default:
            print("error")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destinationViewController = segue.destinationViewController as! PhotoViewController
        
        destinationViewController.image = self.wedding1.image
    }
}
