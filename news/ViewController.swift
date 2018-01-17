//
//  ViewController.swift
//  news
//
//  Created by Nikola Milenkovic on 4/5/17.
//  Copyright © 2017 Nikola Milenkovic. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var tabela: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    getJson()
    getImage()
  
    
    tabela.separatorStyle = .none
    }

    struct Podaci {
        
        var author: String
        var title: String
        var description: String
        var url: String
        var urlToImage: String
        var publishedAt: String
        
    }
    
    var nizStruct = [Podaci]()
    var nizSlike = [String]()
    var nizUIImage = [UIImage]()
    
    let myURL = "https://newsapi.org/v1/articles?source=bloomberg&sortBy=top&apiKey=b9bb70b3887f487783e87181861be2f5"
    
    func getJson(){
    
        if let url = URL(string: myURL){
        
           do{
               let contents = try NSString(contentsOf: url, encoding: String.Encoding.utf8.rawValue)
    
               let convertedString = contents.mutableCopy() as!NSMutableString
               let jData = convertedString.data(using: String.Encoding.utf8.rawValue)
    
           do{
            
              let json = try JSONSerialization.jsonObject(with: jData!, options: []) as? [String:Any]
    
            if let newArray = json?["articles"]! as? NSArray{
                
               
                for i in 0...newArray.count - 1{
                
                    if let newDict = newArray[i] as? [String:String] {
                
                    let author = newDict["author"]!
                    let title = newDict["title"]!
                    let description = newDict["description"]!
                    let url = newDict["url"]!
                    let urlToImage = newDict["urlToImage"]!
                    let publishedAt = newDict["publishedAt"]!
                
                    nizSlike.append(urlToImage)
                
                
                    nizStruct.append(Podaci(author: author, title: title, description: description, url: url, urlToImage: urlToImage, publishedAt: publishedAt))
                    }
                }
                print(nizStruct[0].urlToImage)
                
            }
            
            
            
            
            
    
           }catch{
                   print("nije proslo")
           }
    
           }catch{
                   print("nije proslo")
           }
        
        }
    
    }
    
    func getImage(){
        
        for i in 0...nizSlike.count - 1 {
            
            let imgURL = NSURL(string: nizSlike[i])
            let data = NSData(contentsOf: (imgURL as URL?)!)
            
            let slika = UIImage(data: data! as Data)
            nizUIImage.append(slika!)
            
        }
        
    }
        
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nizStruct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let celija = tableView.dequeueReusableCell(withIdentifier: "mojaCelija") as? MyTableViewCell
        
        celija?.slika.image = nizUIImage[indexPath.row]
        celija?.slika.contentMode = .scaleAspectFill
        celija?.labela.text = nizStruct[indexPath.row].title
        return celija!
    }
    
    
    var selektovani = 0
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        selektovani = indexPath.row
        performSegue(withIdentifier: "mojSegue", sender: self)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC: SecoundViewController = segue.destination as! SecoundViewController
        
        //let color = nizUIImage[selektovani].getColors()
        
        
        secondVC.pripNaslov = nizStruct[selektovani].title
        secondVC.pripSlika = nizUIImage[selektovani]
        secondVC.link = nizStruct[selektovani].url
       
        
       
    
    }
   
        
    
    

}

