//
//  ViewController+MFMessageComposeViewControllerDelegate.swift
//  System View Controllers
//
//  Created by Michael Tseitlin on 6/18/19.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import MessageUI

extension ViewController: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        dismiss(animated: true)
    }
    
    
}
