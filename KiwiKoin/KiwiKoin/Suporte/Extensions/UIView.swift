//
//  UIView.swift
//  KiwiKoin
//
//  Created by Anderson Moura on 26/02/24.
//

import UIKit

extension UIView {
    public func showMessage(view:UIViewController, messege:String, title:String? = "Atenção", btnTitle:String? = "OK") {
        let alert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: btnTitle, style: .default, handler: nil))
        view.present(alert, animated: true)
    }
}
