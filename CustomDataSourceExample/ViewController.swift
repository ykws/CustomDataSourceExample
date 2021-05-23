//
//  ViewController.swift
//  CustomDataSourceExample
//
//  Created by KAWASHIMA Yoshiyuki on 2021/05/15.
//

import UIKit
import ReSwift

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var customView: CustomView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
        
        mainStore.dispatch(CounterActionInitialize())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainStore.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mainStore.unsubscribe(self)
    }

}

// MARK: - Custom View Delegate

extension ViewController: CustomViewDelegate {
    
    func customView(_ customView: CustomView, didSelectCountUp: Void) {
        mainStore.dispatch(CounterActionIncrease())
    }
    
    func customView(_ customView: CustomView, didSelectCountDown: Void) {
        mainStore.dispatch(CounterActionDecrease())
    }

}

// MARK: - Store Subscriber

extension ViewController: StoreSubscriber {

    func newState(state: AppState) {
        customView.counter.text = "\(state.counter)"
        customView.upButton.isEnabled = state.increasable
        customView.downButton.isEnabled = state.decreasable
    }

}
