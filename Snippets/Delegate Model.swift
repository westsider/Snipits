//
//  Delegate Model.swift
//  Snippets
//
//  Created by Warren Hansen on 5/21/19.
//  Copyright © 2019 Warren Hansen. All rights reserved.
//

//
//  BaseScreen.swift
//  Delagate Pattern
//
//  Created by Warren Hansen on 5/21/19.
//  Copyright © 2019 Warren Hansen. All rights reserved.
//

import UIKit
//--------------------- Intern ---------------------------------
class BaseScreen: UIViewController, SideSelectionDelegate {
    @IBOutlet weak var nameLabel: UILabel!
    let network = Network()
    override func viewDidLoad() {
        super.viewDidLoad()
        network.selectionDelegate = self
        network.startTimer()
    }
    @IBAction func chooseButtonTapped(_ sender: UIButton) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "SelectionScreen") as! SelectionScreen
        selectionVC.selectionDelegate = self
        present(selectionVC, animated: true,completion: nil)
    }
    func didTapChoice(name: String) {
        nameLabel.text = name
    }
}


//--------------------- BOSS ----------------------------------

protocol SideSelectionDelegate {
    func didTapChoice(name:String)
}
class SelectionScreen: UIViewController {
    var selectionDelegate:SideSelectionDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func imperiiLBUTTONTAPPED(_ sender: UIButton) {
        selectionDelegate.didTapChoice(name: "Imperial")
        dismiss(animated: true, completion: nil)
    }
    @IBAction func rebelButtonTapped(_ sender: UIButton) {
        selectionDelegate.didTapChoice(name: "Rebel")
        dismiss(animated: true, completion: nil)
    }
}

//------------------- Network Call -----------------------------

class Network {
    var timer : Timer?
    var counter = 0
    var selectionDelegate:SideSelectionDelegate!
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval:1, target:self, selector:#selector(prozessTimer), userInfo: nil, repeats: true)
    }
    @objc func prozessTimer() {
        counter += 1
        let message = "This is a second  \(counter)"
        selectionDelegate.didTapChoice(name: message)
        print(message)
    }
}


