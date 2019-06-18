//
//  ViewController.swift
//  System View Controllers
//
//  Created by Michael Tseitlin on 6/18/19.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import MessageUI
import SafariServices
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let url = URL(string: "http://apple.com")!

    @IBAction func shareTapped(_ sender: UIButton) {
        guard let image = imageView.image else { return }
        
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        present(activityController, animated: true)
    }
    
    @IBAction func safariTapped(_ sender: UIButton) {
        let configuration = SFSafariViewController.Configuration()
        configuration.barCollapsingEnabled = false
        let safariViewController = SFSafariViewController(url: url, configuration: configuration)
        
        present(safariViewController, animated: true)
    }
    
    @IBAction func cameraTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true)
            }
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { action in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true)
            }
            alertController.addAction(photoLibraryAction)
        }
        
        present(alertController, animated: true)
    }
    
    @IBAction func emailTapped(_ sender: UIButton) {
        guard MFMailComposeViewController.canSendMail() else {
            print(#line, #function, "Can't send mail")
            return
        }
        
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        
        mailComposer.setToRecipients([])
        mailComposer.setSubject("Some message")
        mailComposer.setMessageBody("Look what i can:", isHTML: false)
        
        guard let image = imageView.image else { return }
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        mailComposer.addAttachmentData(imageData, mimeType: "image/jpeg", fileName: "image.jpg")
        
        present(mailComposer, animated: true)
    }
    @IBAction func messageTapped(_ sender: UIButton) {
        
        guard MFMessageComposeViewController.canSendText() else {
            print(#line, #function, "SMS services are not available")
            return
        }
        
        guard MFMessageComposeViewController.canSendAttachments() else {
            print(#line, #function, "Attachments are not available")
            return
        }
        
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        composeVC.recipients = []
        composeVC.body = ""
        
        guard let image = imageView.image else { return }
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        composeVC.addAttachmentData(imageData, typeIdentifier: "image/jpeg", filename: "image.jpg")
        
        present(composeVC, animated: true)
    }
}
