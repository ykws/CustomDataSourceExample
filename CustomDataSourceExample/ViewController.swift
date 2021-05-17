//
//  ViewController.swift
//  CustomDataSourceExample
//
//  Created by KAWASHIMA Yoshiyuki on 2021/05/15.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private var presenter: CustomViewPresenterInput!
    
    func inject(presenter: CustomViewPresenterInput) {
        self.presenter = presenter
    }

    // MARK: - Outlets
    
    @IBOutlet weak var customView: CustomView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inject(presenter: CustomViewPresenter.init(view: self))
        
        customView.dataSource = self
        customView.delegate = self
        
        customView.reloadData()
    }

}

// MARK: - Custom View DataSource

extension ViewController: CustomViewDataSource {
    
    func customView(_ customView: CustomView, label: UILabel) -> UILabel {
        label.text = String(presenter.count)
        return label
    }
    
    func customView(_ customView: CustomView, upButton: UIButton) -> UIButton {
        upButton.isEnabled = presenter.countUppable
        return upButton
    }
    
    func customView(_ customView: CustomView, downButton: UIButton) -> UIButton {
        downButton.isEnabled = presenter.countDownable
        return downButton
    }

}

// MARK: - Custom View Delegate

extension ViewController: CustomViewDelegate {
    
    func customView(_ customView: CustomView, didSelectCountUp: Void) {
        presenter.didSelectUpButton()
    }
    
    func customView(_ customView: CustomView, didSelectCountDown: Void) {
        presenter.didSelectDownButton()
    }

}

// MARK: - Custom View Presenter Output

extension ViewController: CustomViewPresenterOutput {

    func updateCount(_ count: Int) {
        customView.reloadData()
    }

}
