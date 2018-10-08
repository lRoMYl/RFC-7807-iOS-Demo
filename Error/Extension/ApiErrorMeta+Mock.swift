// Copyright © 2018 Cheah Bee Kim. All rights reserved.
// 

import Foundation

extension ApiErrorMeta {
    static func mockSoftUpdate() -> ApiErrorMeta {
        let actionOk = ApiErrorMetaAction(
            title: "Ok", url: nil)
        let actionUrl = ApiErrorMetaAction(
            title: "Update",
            url: URL(string: "https://itunes.apple.com/app/facebook/id284882215"))
        
        let mockError = ApiErrorMeta(
            code: 1001,
            traceId: "somelongid",
            title: "Opps...",
            message: "Please update the app for more awesome features :)",
            style: .alert,
            actions: [actionOk, actionUrl])
        return mockError
    }
    
    static func mockHardUpdate() -> ApiErrorMeta {
        let actionUpdate = ApiErrorMetaAction(
            title: "Update",
            url: URL(string: "https://itunes.apple.com/app/facebook/id284882215"))
        
        let mockError = ApiErrorMeta(
            code: 1001,
            traceId: "somelongid",
            title: "Opps...",
            message: "This version is outdated, please update the app",
            style: .alert,
            actions: [actionUpdate])
        return mockError
    }
    
    static func mockLearnMore() -> ApiErrorMeta {
        let actionOk = ApiErrorMetaAction(
            title: "Ok", url: nil)
        let actionUrl = ApiErrorMetaAction(
            title: "Learn more",
            url: URL(string: "http://lmgtfy.com/?q=404"))
        
        let mockError = ApiErrorMeta(
            code: 1001,
            traceId: "somelongid",
            title: "Opps...",
            message: "Your access level is not high enough to access this page",
            style: .alert,
            actions: [actionOk, actionUrl])
        return mockError
    }
    
    static func mockMultilineAlert() -> ApiErrorMeta {
        let actionOk = ApiErrorMetaAction(
            title: "Ok", url: nil)
        let actionUrl = ApiErrorMetaAction(
            title: "Let me google for you...",
            url: URL(string: "http://lmgtfy.com/?q=404"))
        
        let mockError = ApiErrorMeta(
            code: 1001,
            traceId: "somelongid",
            title: "Opps...",
            message: "The server is currently undergoing maintenance. Our engineers will are working around the clock to fix it A.S.A.P",
            style: .alert,
            actions: [actionOk, actionUrl])
        return mockError
    }
    
    static func mockEmptyActionAlert() -> ApiErrorMeta {
        let mockError = ApiErrorMeta(
            code: 1001,
            traceId: "somelongid",
            title: "Opps...",
            message: "Something went wrong...", style: .alert,
            actions: [])
        return mockError
    }
    
    static func mockCustom() -> ApiErrorMeta {
        let actionOk = ApiErrorMetaAction(
            title: "Ok", url: nil)
        let actionUrl = ApiErrorMetaAction(
            title: "Let me google for you...",
            url: URL(string: "http://lmgtfy.com/?q=404"))
        
        let mockError = ApiErrorMeta(
            code: 1001,
            traceId: "somelongid",
            title: "Opps...",
            message: "The server is currently undergoing maintenance. Our engineers will are working around the clock to fix it A.S.A.P",
            style: .custom,
            actions: [actionOk, actionUrl])
        return mockError
    }
    
    static func mockOverlay() -> ApiErrorMeta {
        let mockError = ApiErrorMeta(
            code: 1001,
            traceId: "somelongid",
            title: "Opps...",
            message: "The server is currently undergoing maintenance. Our engineers will are working around the clock to fix it A.S.A.P",
            style: .overlay,
            actions: [])
        return mockError
    }
}
