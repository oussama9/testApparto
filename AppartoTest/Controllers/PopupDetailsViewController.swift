//
//  PopupDetailsViewController.swift
//  AppartoTest
//

import UIKit
import FontAwesome_swift

class PopupDetailsViewController: UIViewController {
    
    @IBOutlet weak var close: UIButton!
    @IBOutlet weak var popView: UIView!
    @IBOutlet weak var barTags: UILabel!
    @IBOutlet weak var barAddress: UILabel!
    @IBOutlet weak var barName: UILabel!
    @IBOutlet weak var barImage: UIImageView!
    
    var bar : Bar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popView.layer.cornerRadius = 10
        barName.text = bar?.name
        barAddress.text = bar?.address
        barTags.text = bar?.tags
        close.titleLabel?.font = UIFont.fontAwesome(ofSize: 30, style: .solid)
        close.setTitle(String.fontAwesomeIcon(name: .timesCircle), for: .normal)
        if bar!.image_url != nil {
            BarsServices.loadAndSetUpImageByUrl(image_url: bar!.image_url!, barImage: self.barImage)
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
