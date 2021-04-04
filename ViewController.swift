//
//  ViewController.swift
//  Getapimethods
//
//  Created by Jomms on 13/01/21.
//

import UIKit

//var firstview = FirstTableViewCell()
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    var get1 = String()
    var get2 = String()
    var get3 = String()
     
    var jsondata = NSArray()
    var getdata = NSMutableData()
    var dict = NSDictionary()
    var idarray = NSArray()
    var id = String()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblview.dequeueReusableCell(withIdentifier:"cell", for:indexPath) as! FirstTableViewCell
        cell.id_txtfld?.text = get1
        cell.user_txttfld?.text = get2
        cell.titl_fld?.text = get3
        
     //   cell.id_txtfld?.text = String()
       // cell.user_txttfld?.text
       // cell.titl_fld?.text
        
        return cell
    }
    
    
    
    @IBOutlet weak var tblview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblview.dataSource = self
        tblview.delegate = self
        view.addSubview(tblview)
        
  let url_str = URL(string:"https://jsonplaceholder.typicode.com/albums")
  let url_req = URLRequest(url:url_str!)
  let task = URLSession.shared.dataTask(with: url_req){(data,request,error) in
        if  let mydata = data
    {
        print("mydata-->",mydata)
        
        do{
            self.getdata.append(mydata)
            self.jsondata = try JSONSerialization.jsonObject(with: self.getdata as Data, options: []) as! NSArray
            print("jesondata-->",self.jsondata)
            self.dict = self.jsondata.object(at:0) as! NSDictionary
            
           
            
            print("Dict--->>>",self.dict)
        
            do
            {
                DispatchQueue.main.async {
                    self.get1 = String(describing: self.dict["userId"]!)
                    self.get2 = String(describing:self.dict["id"]!)
                    self.get3 = String(describing: self.dict["title"]!)
                    
                   // self.id.text = self.get1
                   // self.user_txttfld!.text = self.get2
                  //  self.titl_fld!.text = self.get3
                }
            }
        }
            catch
            {
                print("error",error.localizedDescription)
            }
    }
  };
        task.resume()
}
        
        
    }


