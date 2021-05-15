//
//  ViewController.swift
//  CustomDataSourceExample
//
//  Created by KAWASHIMA Yoshiyuki on 2021/05/15.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private var count: Int = 0
    
    // MARK: - Outlets
    
    @IBOutlet weak var customView: CustomView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.dataSource = self
        customView.delegate = self
        
        customView.reloadData()
    }

}

// MARK: - Custom View DataSource

extension ViewController: CustomViewDataSource {
    
    func customView(_ customView: CustomView, label: UILabel) -> UILabel {
        label.text = String(count)
        return label
    }
    
    func customView(_ customView: CustomView, upButton: UIButton) -> UIButton {
        upButton.isEnabled = count < 9
        return upButton
    }
    
    func customView(_ customView: CustomView, downButton: UIButton) -> UIButton {
        downButton.isEnabled = count > 0
        return downButton
    }

}

// MARK: - Custom View Delegate

extension ViewController: CustomViewDelegate {
    
    func customView(_ customView: CustomView, didSelectCountUp: Void) {
        count += 1
        customView.reloadData()
    }
    
    func customView(_ customView: CustomView, didSelectCountDown: Void) {
        count -= 1
        customView.reloadData()
    }

}
