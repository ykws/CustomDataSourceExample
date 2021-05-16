//
//  ViewController.swift
//  CustomDataSourceExample
//
//  Created by KAWASHIMA Yoshiyuki on 2021/05/15.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private let count = BehaviorRelay(value: 0)
    private let disposeBag = DisposeBag()
    
    // MARK: - Outlets
    
    @IBOutlet weak var customView: CustomView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count.map { String($0) }
            .bind(to: customView.counter.rx.text)
            .disposed(by: disposeBag)
        
        count.map { $0 < 9 }
            .bind(to: customView.upButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        count.map { $0 > 0 }
            .bind(to: customView.downButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        customView.upButton.rx.tap
            .subscribe { [unowned self] _ in
                count.accept(count.value + 1)
            }
            .disposed(by: disposeBag)
        
        customView.downButton.rx.tap
            .subscribe { [unowned self] _ in
                count.accept(count.value - 1)
            }
            .disposed(by: disposeBag)
    }

}
