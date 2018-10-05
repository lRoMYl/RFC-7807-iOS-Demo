// Copyright © 2018 Cheah Bee Kim. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didTapOption() {
        displayActionSheet()
    }
    
    private func displayActionSheet() {
        let sheet = UIAlertController.init(title: "Actions", message: "Choose your poison", preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "Soft Update Alert", style: .default) { (_) in
            let error = ApiErrorMeta.mockSoftUpdate()
            self.present(error: error, presenter: self)
        }
        let action2 = UIAlertAction(title: "Force Update Alert", style: .default) { (_) in
            let error = ApiErrorMeta.mockHardUpdate()
            self.present(error: error, presenter: self)
        }
        let action3 = UIAlertAction(title: "Learn more? Alert", style: .default) { (_) in
            let error = ApiErrorMeta.mockLearnMore()
            self.present(error: error, presenter: self)
        }
        let action4 = UIAlertAction(title: "Multiline alert", style: .default) { (_) in
            let error = ApiErrorMeta.mockAlert()
            self.present(error: error, presenter: self)
        }
        let action5 = UIAlertAction(title: "Custom Error View", style: .default) { (_) in
            let error = ApiErrorMeta.mockCustom()
            self.present(error: error, presenter: self)
        }
        let action6 = UIAlertAction(title: "Error Overlay", style: .default) { (_) in
            let error = ApiErrorMeta.mockOverlay()
            self.present(error: error, presenter: self)
        }
        sheet.addAction(action1)
        sheet.addAction(action2)
        sheet.addAction(action3)
        sheet.addAction(action4)
        sheet.addAction(action5)
        sheet.addAction(action6)
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(sheet, animated: true, completion: nil)
    }
}

