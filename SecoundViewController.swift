//
//  SecoundViewController.swift
//  news
//
//  Created by Nikola Milenkovic on 4/6/17.
//  Copyright © 2017 Nikola Milenkovic. All rights reserved.
//

import UIKit


class SecoundViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      secText.sizeToFit()
        
      secImage.image = pripSlika
      //secText.text = pripText
      secNaslov.text = pripNaslov
      secImage.contentMode = .scaleAspectFill
      
        
    }
    
    

    var gradient = CAGradientLayer()
    
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var secImage: UIImageView!
    @IBOutlet weak var secNaslov: UILabel!
    @IBOutlet weak var secText: UILabel!
    
    var pripSlika: UIImage?
    var pripNaslov: String?
    var pripText: String?
    var link: String?
    
    @IBAction func openWeb(_ sender: UIBarButtonItem){
    performSegue(withIdentifier: "webView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let webVC: WebViewController = segue.destination as! WebViewController
    
        if link != nil {
            webVC.url = link
        }
    
    }
    
}
