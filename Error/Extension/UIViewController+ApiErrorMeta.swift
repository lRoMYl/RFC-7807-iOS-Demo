// Copyright © 2018 Cheah Bee Kim. All rights reserved.
// 

import UIKit
import SVProgressHUD

extension UIViewController {
    func present(error: ApiErrorMeta, presenter: UIViewController) {
        switch error.style {
        case .alert:
            UIAlertController.present(error: error, presenter: self)
        case .custom:
            CustomErrViewController.present(error: error, presenter: self)
        case .overlay:
            SVProgressHUD.present(error: error)
        }
    }
}
