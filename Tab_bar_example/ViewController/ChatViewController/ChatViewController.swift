//
//  ChatViewController.swift
//  Tab_bar_example
//
//  Created by Biolizard on 31/10/2018.
//  Copyright © 2018 Biolizard. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    init(){
        super.init(nibName: "ChatViewController", bundle: nil)
        self.tabBarItem.image = UIImage(named: "message")
        self.title = NSLocalizedString("tittle_chats", comment: "")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
 
    
    override func viewDidLoad() {
         setupBarButtonsItems()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    private func setupBarButtonsItems(){
        
        let addButton = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(onButtonPresssed))
            navigationItem.setRightBarButton(addButton, animated: false)
       
    }
    @objc private func onButtonPresssed(){
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
