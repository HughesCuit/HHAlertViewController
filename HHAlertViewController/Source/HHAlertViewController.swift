//
//  HHAlertViewController.swift
//  CustomAlertController
//
//  Created by 黄河 on 2017/6/30.
//  Copyright © 2017年 黄河. All rights reserved.
//

import UIKit

open class HHAlertViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var actionCollection: UICollectionView!
    @IBOutlet weak var actionCollectionHeightConstraint: NSLayoutConstraint!
    
    
    var titleString: String = ""
    var message: String = ""
    var actions: [AlertActionButton] = [] {
        didSet{
            actionCollectionHeightConstraint.constant = 44.0 * CGFloat(actions.count)
        }
    }
    
    override open var modalTransitionStyle: UIModalTransitionStyle {
        set{
            
        }
        get{
            return .crossDissolve
        }
    }
    override open var modalPresentationStyle: UIModalPresentationStyle {
        set{
            
        }
        get{
            return .overCurrentContext
        }
    }
    
    convenience init(title: String, message: String, actions: [AlertActionButton]) {
        self.init()
        self.titleString = title
        self.message = message
        self.actions = actions
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let classString = String(describing: type(of: self))
        if Bundle.main.path(forResource: classString, ofType: "nib") == nil {
            super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
            
        } else {
            super.init(nibName: nibNameOrNil ?? classString, bundle: nibBundleOrNil)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        actionCollectionHeightConstraint.constant = 44.0 * CGFloat(actions.count)
        actionCollection.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "ActionCell")
        titleLabel.text = titleString
        messageLabel.text = message
        actions.forEach { (acBtn) in
            let act = acBtn.action
            acBtn.action = {[weak self] btn in
                act(btn)
                self?.dismiss(animated: true, completion: {
                    
                })
            }
        }
    }

}
extension HHAlertViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actions.count
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActionCell", for: indexPath)
        cell.contentView.addSubview(actions[indexPath.row])
        return cell
    }
}
