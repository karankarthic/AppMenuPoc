//
//  ViewFactroy.swift
//  AppMenuPoc
//
//  Created by Karan Karthic Neelamegan on 09/12/22.
//

import UIKit

extension PopoverViewController: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}

class PopoverViewController: UIViewController {
    override func viewDidLoad() {
        self.view.backgroundColor = .systemGray
        self.preferredContentSize = CGSize(width: 300, height: 200)
    }
}
