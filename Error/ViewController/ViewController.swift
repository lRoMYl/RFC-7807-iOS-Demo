// Copyright © 2018 Cheah Bee Kim. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    private struct ErrorWrapper {
        let title: String
        let meta: ApiErrorMeta
    }
    
    private let errors: [ErrorWrapper] = [
        ErrorWrapper(title: "Soft Update Alert", meta: ApiErrorMeta.mockSoftUpdate()),
        ErrorWrapper(title: "Force Update Alert", meta: ApiErrorMeta.mockHardUpdate()),
        ErrorWrapper(title: "Learn more? Alert", meta: ApiErrorMeta.mockLearnMore()),
        ErrorWrapper(title: "Multiline Alert", meta: ApiErrorMeta.mockMultilineAlert()),
        ErrorWrapper(title: "Empty Actions Alert", meta: ApiErrorMeta.mockEmptyActionAlert()),
        ErrorWrapper(title: "Custom Error View", meta: ApiErrorMeta.mockCustom()),
        ErrorWrapper(title: "Error Overlay", meta: ApiErrorMeta.mockOverlay())
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didTapOption() {
        displayActionSheet()
    }
    
    private func displayActionSheet() {
        let sheet = UIAlertController.init(title: "Actions", message: "Choose your poison", preferredStyle: .actionSheet)
        errors.forEach { (error) in
            let action = UIAlertAction(title: error.title, style: .default, handler: { [weak self] (_) in
                guard let strongSelf = self else { return }
                strongSelf.present(error: error.meta, presenter: strongSelf)
            })
            sheet.addAction(action)
        }
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(sheet, animated: true, completion: nil)
    }
}

