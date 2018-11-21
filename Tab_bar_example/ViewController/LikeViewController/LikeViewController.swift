//
//  LikeViewController.swift
//  Tab_bar_example
//
//  Created by Biolizard on 31/10/2018.
//  Copyright © 2018 Biolizard. All rights reserved.
//

import UIKit
import Alamofire
class LikeViewController: UIViewController {
    @IBOutlet weak var tableViewUsers: UITableView!
        internal var users: [Users] = []
    init(){
        super.init(nibName: "LikeViewController", bundle: nil)
        self.tabBarItem.image = UIImage(named: "like")
   self.title = NSLocalizedString("tittle_favorites", comment: "")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        registercells()
 getUsersAlamofire()
        
    }
    private func registercells(){
        
        
        let identifierInfoCell = "InfoCell"
        let cellNibSwitch = UINib(nibName: identifierInfoCell, bundle: nil)
        tableViewUsers.register(cellNibSwitch, forCellReuseIdentifier: "InfoCell")
        
        tableViewUsers.register(cellNibSwitch, forCellReuseIdentifier: identifierInfoCell)
    }
    internal func getUsersAlamofire(){
        Alamofire.request("https://jsonplaceholder.typicode.com/users", method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseData {(response) in
            if let jsonData = response.data {
                let decoder = JSONDecoder()
                do {
                    self.users = try decoder.decode([Users].self, from: jsonData)
                    print("Total users using Alamofire: ", self.users.count)
                    self.tableViewUsers.reloadData()
                }
                catch let error {
                    print("Error decoding [User]:", error.localizedDescription)
                }
            }
        }
    }
    
    
    

}
extension LikeViewController:
UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let user = users[indexPath.row]
        
       
        let mapVC = MapViewController(lat: Double(user.address.geo.lat), lng:
            Double(user.address.geo.lng)!)
        
        navigationController?.pushViewController(mapVC, animated: true)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:InfoCell = (tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as? InfoCell)!
        
        let user = users[indexPath.row]
        cell.lbl_info.text =  user.name
        return cell
    }
    
    
    
    
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


