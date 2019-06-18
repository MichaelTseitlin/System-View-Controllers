//
//  ViewController+MFMailComposeViewControllerDelegate.swift
//  System View Controllers
//
//  Created by Michael Tseitlin on 6/18/19.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import MessageUI

// MARK: - MFMailComposeViewControllerDelegate
extension ViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true)
    }
}
