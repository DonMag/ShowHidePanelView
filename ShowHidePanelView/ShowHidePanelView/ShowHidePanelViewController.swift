//
//  ShowHidePanelViewController.swift
//  ShowHidePanelView
//
//  Created by Don Mag on 8/29/18.
//  Copyright © 2018 DonMag. All rights reserved.
//

import UIKit

class ShowHidePanelViewController: UIViewController {

	@IBOutlet var shadowView: UIView!
	
	// Note: this must be a STRONG reference, not WEAK, as we will
	// be activating / deactivating it at runtime
	@IBOutlet var panelHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
		
		// change panelHeightConstraint priority
		// it is set to LOW during design
		panelHeightConstraint.priority = .required
		
		// hide the shadowView on load
		shadowView.isHidden = true
    }

	@IBAction func parametersTapped(_ sender: Any) {
		
		// toggle panelHeightConstraint
		panelHeightConstraint.isActive = !panelHeightConstraint.isActive
		
		// show or hide shadowView, based on panelHeightConstraint
		shadowView.isHidden = panelHeightConstraint.isActive
		
		// animate the change
		UIView.animate(withDuration: 0.25, animations: {
			self.view.layoutIfNeeded()
		})
		
	}
	
}
