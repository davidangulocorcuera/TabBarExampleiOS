//
//  ContactViewController.swift
//  Tab_bar_example
//
//  Created by Biolizard on 31/10/2018.
//  Copyright © 2018 Biolizard. All rights reserved.
//

import UIKit
import Alamofire
class ContactViewController: UIViewController {
    @IBOutlet weak var tableViewInfo: UITableView!
    
    @IBOutlet weak var tf_id: UITextField!
    internal var posts: [Post] = []
    
    init(){
        super.init(nibName: "ContactViewController", bundle: nil)
        self.tabBarItem.image = UIImage(named: "contact")
        self.title = NSLocalizedString("tittle_contacts", comment: "")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        registercells()
        getPosts(for: 1)
        getPostsAlamofire(userId: 1)
        // Do any additional setup after loading the view.
    }
    private func registercells(){
        
        
        let identifierInfoCell = "InfoCell"
        let cellNibSwitch = UINib(nibName: identifierInfoCell, bundle: nil)
        tableViewInfo.register(cellNibSwitch, forCellReuseIdentifier: "InfoCell")
        
        tableViewInfo.register(cellNibSwitch, forCellReuseIdentifier: identifierInfoCell)
    }
    internal func getPosts(for userId: Int){
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "jsonplaceholder.typicode.com"
        urlComponents.path = "/posts"
        
        let userIdItem = URLQueryItem(name: "userId", value: "\(userId)")
        urlComponents.queryItems = [userIdItem]
        guard let url = urlComponents.url else {fatalError("Could not create URL")}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData: Data?, response: URLResponse?, error: Error?) in
            if let errorResponse = error{
                print("Error: ", errorResponse.localizedDescription)
            }
            else if let jsonData = responseData {
                let decoder = JSONDecoder()
                do {
                    let posts = try decoder.decode([Post].self, from: jsonData)
                    print("Total posts: ", posts.count)
                }
                catch let error {
                    print("Error decoding [Post]:", error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    @IBAction func buttonPressed(){
        if let text = tf_id.text{
            if let userId = Int(text){
                getPostsAlamofire(userId: userId)
            }
            else{
                
            }
        }
    }
   
    
    
    internal func getPostsAlamofire(userId: Int){
        Alamofire.request("https://jsonplaceholder.typicode.com/posts", method: HTTPMethod.get, parameters: ["userId" : userId], encoding: URLEncoding.default, headers: nil).responseData {(response) in
            if let jsonData = response.data {
                let decoder = JSONDecoder()
                do {
                    self.posts = try decoder.decode([Post].self, from: jsonData)
                    print("Total posts using Alamofire: ", self.posts.count)
                    self.tableViewInfo.reloadData()
                }
                catch let error {
                    print("Error decoding [Post]:", error.localizedDescription)
                }
            }
        }
    }

            
        
        
        
    }
extension ContactViewController:
UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let post = posts[indexPath.row]
        let comentsVC = ComentsViewController(postId: post.id)
        navigationController?.pushViewController(comentsVC, animated: true)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:InfoCell = (tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as? InfoCell)!
       
        let post = posts[indexPath.row]
        cell.lbl_info.text =  post.title
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


