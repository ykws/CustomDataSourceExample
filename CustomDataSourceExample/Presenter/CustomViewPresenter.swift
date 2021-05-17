//
//  CustomViewPresenter.swift
//  CustomDataSourceExample
//
//  Created by KAWASHIMA Yoshiyuki on 2021/05/18.
//

import Foundation

protocol CustomViewPresenterInput: AnyObject {
    var count: Int { get }
    var countUppable: Bool { get }
    var countDownable: Bool { get }
    
    func didSelectUpButton()
    func didSelectDownButton()
}

protocol CustomViewPresenterOutput: AnyObject {
    func updateCount(_ count: Int)
}

final class CustomViewPresenter: CustomViewPresenterInput {

    private weak var view: CustomViewPresenterOutput!
    var count: Int = 0
    var countUppable: Bool {
        count < 9
    }
    var countDownable: Bool {
        count > 0
    }
    
    init(view: CustomViewPresenterOutput) {
        self.view = view
    }
    
    func didSelectUpButton() {
        guard countUppable else { return }
        
        count += 1
        view.updateCount(count)
    }
    
    func didSelectDownButton() {
        guard countDownable else { return }
        
        count -= 1
        view.updateCount(count)
    }

}
