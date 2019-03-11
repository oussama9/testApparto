//
//  ViewController.swift
//  AppartoTest

import UIKit
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var barArray = [Bar]()
    var selectedBar : Bar?
    @IBOutlet weak var barsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       barArray = BarsServices.instance.bars
        self.barsTable.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return barArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell
        cell.delegate = self
        cell.setup(bar: barArray[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "mapSegue"){
            let mapView = segue.destination as! MapViewController
            mapView.isFromTable = true
            if let indexPath = self.barsTable.indexPathForSelectedRow {
                let selectedBar = barArray[indexPath.row]
                mapView.bar = selectedBar
            }
        }
        if (segue.identifier == "toDetails")   {
            let detailView = segue.destination as! PopupDetailsViewController
            detailView.bar = self.selectedBar
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        UIView.animate(withDuration: 1.0) {
            cell.alpha = 1.0
        }
        cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.4) {
            cell.transform = CGAffineTransform.identity
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Bars"
    }
}

extension ViewController : BarCellDelegate {
    func didTabDetails(bar: Bar) {
        self.selectedBar = bar;
        performSegue(withIdentifier: "toDetails", sender: self)
    }
}
