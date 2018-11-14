//
//  ComentsViewController.swift
//  Tab_bar_example
//
//  Created by Biolizard on 14/11/2018.
//  Copyright © 2018 Biolizard. All rights reserved.
//

import UIKit
import Alamofire
class ComentsViewController: UIViewController {
var postId :Int!
internal var coments: [Coments] = []
     @IBOutlet weak var tableViewComents: UITableView!
    convenience init(postId: Int!){
        self.init()
        self.postId = postId
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getPostsAlamofire(postId: postId)
registercells()
        // Do any additional setup after loading the view.
    }
    private func registercells(){
        
        
        let identifierInfoCell = "InfoCell"
        let cellNibSwitch = UINib(nibName: identifierInfoCell, bundle: nil)
        tableViewComents.register(cellNibSwitch, forCellReuseIdentifier: "InfoCell")
        
        tableViewComents.register(cellNibSwitch, forCellReuseIdentifier: identifierInfoCell)
    }
    internal func getPostsAlamofire(postId: Int){
        Alamofire.request("https://jsonplaceholder.typicode.com/comments", method: HTTPMethod.get, parameters: ["postId" : postId], encoding: URLEncoding.default, headers: nil).responseData {(response) in
            if let jsonData = response.data {
                let decoder = JSONDecoder()
                do {
                    self.coments = try decoder.decode([Coments].self, from: jsonData)
                    print("Total posts using Alamofire: ", self.coments.count)
                    //self.tableViewInfo.reloadData()
                     self.tableViewComents.reloadData()
                }
                catch let error {
                    print("Error decoding [Post]:", error.localizedDescription)
                }
            }
        }
    }



}
extension ComentsViewController:
UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coments.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100.0
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:InfoCell = (tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as? InfoCell)!
        
        let coment = coments[indexPath.row]
        cell.lbl_info.text =  coment.body
        return cell
    }
    
    
    
    
}


