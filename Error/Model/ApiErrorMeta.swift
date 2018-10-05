// Copyright © 2018 Cheah Bee Kim. All rights reserved.
// 

import Foundation

struct ApiErrorMeta {
    enum Style {
        case alert
        case overlay
        case custom
    }

    let code: Int
    let traceId: String?
    let title: String?
    let message: String?
    let style: Style
    let actions: [ApiErrorMetaAction]
}

struct ApiErrorMetaAction {
    let title: String
    let url: URL?
}
