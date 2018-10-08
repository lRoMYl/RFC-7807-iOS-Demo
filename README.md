# RFC-7807-iOS-Demo
Demo implementation of RFC-7807 in iOS

# Problem

More often that not, error are mostly handled by displaying either as an overlay or alert with no meaningful context to the user. It has caused the frustration of many users and the generic error message is not helpful enough to allow the customer support to identify or solve the issue for the user.

# Proposal

Ultimately, we would want to solve the issue by displaying a human-readable error message and assist the user to resolve the issue by providing actionable(s) that can be responded on.

We would like to propose the adoption of RFC-7807 specifically to return a custom error message that can be parsed on the client side to display the error view and actionable(s) appropriately. Existing HTTP status code will be maintained with additional JSON body to represent the error object and parsed in the newer client, thus it will not affect the existing error handling.

Error handling should be as barebone and as simple as possible as the use cases is only limited to informing the user of the error in more readable format and possible providing a recovery action.

This is a demo application for the implementation of RFC-7807 custom error handling based on the structure defined below

### Error
| Field     | Description   |
| --------- | :------------ |
| code      | The custom internal error code which can be used to identify/pinpoint the nature of the issue. Do note that this code is not related to the http status code. |
| trace_id  | Stacktrace id that can be used to find the error details in error logger, only for debugging/internal purpose. External consumer/user will have no idea how to use this.|
| title     | Title, keep it as brief as possible and omit the details of the issue.| 
| message   | A human readable details of the error |
| actions   | An array of actions that can will be displayed to the user |

### Action

| Field     | Description   |
| --------- | :------------ |
| title     | The text to be displayed for the action |
| url       | Only universal link is allowed for the action as we can redirect to webview as a fallback behaviour for deeplink that are not introduced to the app yet. We can also allow nil url to simply dismiss the error alert without doing anything. |

```
{
  "error": {
    "code": 1001,  
    "trace_id": "somelongid",
    "title": "Opps",
    "message": "Some error has occured",
    "actions": [
      { 
        "title": "Close"
      }, 
      {
        "title": "Learn More", 
        "url": "http://lmgtfy.com/?q=404"
      }
    ]
  }
}
```

Example of use cases;
- Soft update, we provide both the update action which redirect to the app store along with a cancel button that simply dismiss the view, thus making the update process optional.
[Cancel][Update]
- Force update, we only provide the action to redirect to the app store.
[Update]
- Display an alert with external support URL to explain the issue 
[Close][Learn More]
- Display an alert with full explanation of the issue and provide just a close button
[Close]

---

# Additional consideration

## Fallback action mechanism
If no actions are provided from backend, each platform should fallback to display the view such that it can still be dismissed.
E.g. 
- [iOS] Alert without action will not be dismissible as iOS doesn't have a physical back button and tapping outside out the alert doesn't dismiss it either.

## URL fallback mechanism
- All link provided should have a web counterpart for fallback handling

## Syncing platform action handling
- [iOS] After tapping on any of the action in alert will automatically dismiss the alert, we might want to synchronize this behaviour between all platform
- Based on my past experience, chances are high that Android and iOS doesn't have a centralized mapping with each other or their web counterpart. Recommended to centralized the Universal Link into a spec that can be reused by technical and non-technical users to add new action.

## URL targeting for different platform

There are generally two way that I can think now for the URL to be returned
- The url is massaged by backend and returned directly to the appropriate client, no processing to be done on client side
```
url: "https://www.google.com"
```
- All possible url is returned along with the platform type as the key as below
```
url: {
  ios: "https://www.google.com/ios",
  android: "https://www.google.com/android",
  web: "https://www.google.com/web",
}
```

## Localization

For localization, we can use the `accept-language` header to decide the localization to use for the text and default to en-us if no match was found.

## Complexity

### Code

Having custom `Code` for each error might introduce additional workload to the developers as they will need a way to synchronize the usage of the code doesn't conflict with other services, possibly using a gateway to centralized the implementation. Moreover, we will need a way to propagate the usage of each error code and possibly creating a domain range to categorize the error code, e.g 5000-5999 is reserved for payment related errors.

### Type

Optionally, we might also want to introduce `type` to define the style to be used to display the error. E.g.;
- Overlay
- Alert

Although I think this might be a bit unnecessary as `alert` style should fit the error handling in the most scenario but it really depends on how much control we want to have on the error handling.

Each client will determine how to handle the presentation of the `type` and fallback to a default method to display the error view.
