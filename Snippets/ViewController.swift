//
//  ViewController.swift
//  Snippets
//
//  Created by Warren Hansen on 7/30/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkCall.getPricesFor(ticker: "AAPL", debug: true) { (response) in
            debugPrint(response)
            ParseJSON.getJSON(json: response, debug: true)
        }
    }
}

// requires a tableview, reuse identifier, set delagates in storyboard
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = "Extensions Are Fun"
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row", indexPath.row)
    }
}

