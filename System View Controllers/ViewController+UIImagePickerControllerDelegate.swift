//
//  ViewController+UIImagePickerControllerDelegate.swift
//  System View Controllers
//
//  Created by Michael Tseitlin on 6/18/19.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

// MARK: - UIImagePickerControllerDelegate
extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
        }
        dismiss(animated: true)
    }
}
