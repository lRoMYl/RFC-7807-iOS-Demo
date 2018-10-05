// Copyright © 2018 Cheah Bee Kim. All rights reserved.
// 

import Foundation
import SVProgressHUD

extension SVProgressHUD {
    static func present(error: ApiErrorMeta) {
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setBackgroundColor(.white)
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.setMaximumDismissTimeInterval(2)
        SVProgressHUD.showError(withStatus: error.message)
    }
}
