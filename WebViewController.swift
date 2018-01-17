//
//  WebViewController.swift
//  news
//
//  Created by Nikola Milenkovic on 4/7/17.
//  Copyright © 2017 Nikola Milenkovic. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var darkBG: UIView!
    @IBOutlet weak var aniSlika: UIImageView!
    let nizSlika = [#imageLiteral(resourceName: "slika1"),#imageLiteral(resourceName: "slika2"),#imageLiteral(resourceName: "slika3"),#imageLiteral(resourceName: "slika4"),#imageLiteral(resourceName: "slika5"),#imageLiteral(resourceName: "slika6"),#imageLiteral(resourceName: "slika7"),#imageLiteral(resourceName: "slika8"),#imageLiteral(resourceName: "slika9"),#imageLiteral(resourceName: "slika10"),#imageLiteral(resourceName: "slika11"),#imageLiteral(resourceName: "slika12"),#imageLiteral(resourceName: "slika13"),#imageLiteral(resourceName: "slika14"),#imageLiteral(resourceName: "slika15"),#imageLiteral(resourceName: "slika16"),#imageLiteral(resourceName: "slika17"),#imageLiteral(resourceName: "slika18"),#imageLiteral(resourceName: "slika19"),#imageLiteral(resourceName: "slika20")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if url != nil {
        newURL = url!
        }
        let URL = NSURL(string: newURL)
        let request = URLRequest(url : URL! as URL)
        webView.loadRequest(request)
        //activity()
        webView.delegate = self
        
        anima()
        
    }
    
    func anima(){
        
        aniSlika.animationImages = nizSlika
        aniSlika.animationDuration = 1
        aniSlika.animationRepeatCount = 100
        
        aniSlika.startAnimating()
        
    }

    @IBOutlet weak var webView: UIWebView!
    var url: String?
    var newURL = ""
   
    @IBAction func back(_ sender: UIBarButtonItem) {
    webView.goBack()
    }

    @IBAction func home(_ sender: UIBarButtonItem) {
    
    }
    
    @IBAction func forward(_ sender: UIBarButtonItem){
    webView.goForward()
    }
    
    var activityIndicator = UIActivityIndicatorView()
   
    func activity(){
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = .gray
        
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("poceloOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
    //activityIndicator.stopAnimating()
        aniSlika.isHidden = true
        
        UIView.animate(withDuration: 1, animations: {
            self.aniSlika.alpha = 0
            self.darkBG.alpha = 0
        })
        print("zavrsilOOOOOOOOOOOOOOOOOOOOOOOOOOOOO")
    }
}
