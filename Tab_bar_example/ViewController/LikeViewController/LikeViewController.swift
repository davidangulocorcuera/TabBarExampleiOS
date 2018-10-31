//
//  LikeViewController.swift
//  Tab_bar_example
//
//  Created by Biolizard on 31/10/2018.
//  Copyright © 2018 Biolizard. All rights reserved.
//

import UIKit

class LikeViewController: UIViewController {
    init(){
        super.init(nibName: "LikeViewController", bundle: nil)
        self.tabBarItem.image = UIImage(named: "like")
        self.title = "Favs"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
