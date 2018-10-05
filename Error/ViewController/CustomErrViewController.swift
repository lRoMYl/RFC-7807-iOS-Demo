// Copyright © 2018 Cheah Bee Kim. All rights reserved.
// 

import UIKit

struct CustomErrViewModel {
    let title: String?
    let message: String?
    let actions: [ApiErrorMetaAction]
}

class CustomErrViewController: UIViewController {
    @IBOutlet var dismissButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    
    @IBOutlet var actions: UIStackView!
    
    var viewModel: CustomErrViewModel?
    
    @IBAction func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let viewModel = self.viewModel else { return }
        configure(with: viewModel)
    }
    
    private func configure(with viewModel: CustomErrViewModel) {
        titleLabel.text = viewModel.title
        messageLabel.text = viewModel.message
        
        viewModel.actions.forEach { (action) in
            let button = UIButton(type: .system)
            button.setTitle(action.title, for: .normal)
            button.addTargetClosure { [weak self] _ in
                guard let strongSelf = self else { return }
                guard let url = action.url else {
                    strongSelf.dismiss()
                    return
                }
                UIApplication.shared.open(url, options: [:]) { _ in
                    strongSelf.dismiss()
                }
            }
            actions.addArrangedSubview(button)
        }
    }
}

extension CustomErrViewController {
    static func present(error: ApiErrorMeta, presenter: UIViewController) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let identifier = String(describing: self)
        guard let vc = storyboard
            .instantiateViewController(withIdentifier: identifier)
            as? CustomErrViewController
        else { return }
        
        let viewModel = CustomErrViewModel(
            title: error.title,
            message: error.message,
            actions: error.actions)
        vc.viewModel = viewModel
        
        presenter.present(vc, animated: true, completion: nil)
    }
}
