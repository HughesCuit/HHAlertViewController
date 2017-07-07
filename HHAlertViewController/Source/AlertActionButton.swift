//
//  AlertActionButton.swift
//  CustomAlertController
//
//  Created by 黄河 on 2017/7/5.
//  Copyright © 2017年 黄河. All rights reserved.
//

import UIKit

open class AlertActionButton: UIButton {
    var action: AlertAction = { _ in }
    var title = ""
    
    typealias AlertAction = (AlertActionButton) -> ()
    
    func actionOnTapped() {
        action(self)
    }
    
    fileprivate class func configuredButton(title: String, action: @escaping AlertAction) -> AlertActionButton {
        guard let btn = Bundle.main.loadNibNamed("AlertActionButton", owner: nil, options: nil)?.first as? AlertActionButton else {
            return AlertActionButton()
        }
        btn.title = title
        btn.action = action
        btn.setTitle(title, for: .normal)
        btn.addTarget(btn, action: #selector(actionOnTapped), for: .touchUpInside)
        btn.addConstraint(NSLayoutConstraint(item: btn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 44))
        let borderLayer = CALayer()
        borderLayer.frame = CGRect(origin: .zero, size: CGSize(width: btn.frame.width, height: 0.5))
        borderLayer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).cgColor
        btn.layer.addSublayer(borderLayer)
        return btn
    }
    
    override open var isHighlighted: Bool {
        didSet{
            backgroundColor = isHighlighted ? #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.5) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}

func AlertAction(title: String, action: @escaping AlertActionButton.AlertAction) -> AlertActionButton {
    return AlertActionButton.configuredButton(title: title, action: action)
}
