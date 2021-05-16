//
//  CustomView.swift
//  CustomDataSourceExample
//
//  Created by KAWASHIMA Yoshiyuki on 2021/05/15.
//

import UIKit

final class CustomView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    
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
