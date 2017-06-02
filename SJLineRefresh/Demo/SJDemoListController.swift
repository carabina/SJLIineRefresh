//
//  SJDemoListController.swift
//  SJLineRefresh
//
//  Created by Shi Jian on 2017/5/25.
//  Copyright © 2017年 Shi Jian. All rights reserved.
//

import UIKit


enum SJDemoType: String {
    
    case polygon = "polygon"
    
    
    static func enumAllValues() -> [SJDemoType] {
        
        return [.polygon]
    }
    
}

class SJDemoListController: UITableViewController {

    lazy var demoType = SJDemoType.polygon
    
    let demos = SJDemoType.enumAllValues()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
    }
    
    
    //MARK: - delegate datasource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return demos.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        demoType = demos[indexPath.row]
        
        performSegue(withIdentifier: "jump2demo", sender: self)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as! SJDemoViewController
        
        destination.demoType = demoType
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 75
    }

}
