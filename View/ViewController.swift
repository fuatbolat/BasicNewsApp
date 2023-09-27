//
//  ViewController.swift
//  BasicNewsApp
//
//  Created by Fuat Bolat on 13.04.2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        //Url created
        let url = URL(string:"https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json" )
        
        WebService().haberleriIndir(uRl: url!) { (haberler) in
            if let haberler = haberler {
                print(haberler)
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        as! NewsCellTableViewCell
        
        return cell
    }


}

