//
//  CustomView.swift
//  CustomDataSourceExample
//
//  Created by KAWASHIMA Yoshiyuki on 2021/05/15.
//

import UIKit

protocol CustomViewDataSource: AnyObject {
    func customView(_ customView: CustomView, label: UILabel) -> UILabel
    func customView(_ customView: CustomView, upButton: UIButton) -> UIButton
    func customView(_ customView: CustomView, downButton: UIButton) -> UIButton
}

protocol CustomViewDelegate: AnyObject {
    func customView(_ customView: CustomView, didSelectCountUp: Void)
    func customView(_ customView: CustomView, didSelectCountDown: Void)
}

final class CustomView: UIView {
    
    // MARK: - Properties
    
    weak var dataSource: CustomViewDataSource?
    weak var delegate: CustomViewDelegate?
    
    // MARK: - Outlets
    
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    
    // MARK: - Actions
    
    @IBAction func countUp(_ sender: Any) {
        delegate?.customView(self, didSelectCountUp: ())
    }

    @IBAction func countDown(_ sender: Any) {
        delegate?.customView(self, didSelectCountDown: ())
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
    }
    
    private func loadNib() {
        if let view = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self)?.first as? UIView {
            view.frame = self.bounds
            self.addSubview(view)
        }
    }

}

// MARK: - Reloading the Custom View

extension CustomView {
    
    func reloadData() {
        _ = dataSource?.customView(self, label: counter)
        _ = dataSource?.customView(self, upButton: upButton)
        _ = dataSource?.customView(self, downButton: downButton)
    }

}
