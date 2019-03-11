//
//  TabBarController.swift
//  AppartoTest
//

import UIKit

class TabBarController: UITabBarController {
    @IBOutlet var myTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTabBar.items?[0].image = UIImage.fontAwesomeIcon(
            name: .clipboardList,
            style: .solid,
            textColor: .red,
            size: CGSize(width: 35, height: 35)
        );
        self.myTabBar.items?[1].image = UIImage.fontAwesomeIcon(
            name: .map,
            style: .solid,
            textColor: .red,
            size: CGSize(width: 35, height: 35)
        );
    }
}
