import UIKit

class SubscriptionSuccessViewController: BaseViewController {
    // MARK: - Outlets
    @IBOutlet weak var vpnTitleLbl: UILabel!
    @IBOutlet weak var subscriptionSuccessTitleLbl: UILabel!
    @IBOutlet weak var subscriptionSuccessDescriptionLbl: UILabel!
    @IBOutlet weak var letsGo: UILabel!

    // MARK: - Lifecycle
    override func setInitailUi() {
        vpnTitleLbl.font = UIFont(name: FontName.satoshiVariableBoldItalic, size: 24)
        vpnTitleLbl.textColor = UIColor(hex: "1D3D5B")

        subscriptionSuccessTitleLbl.font = UIFont(name: FontName.satoshiBold, size: 36)
        subscriptionSuccessTitleLbl.textColor = UIColor(hex: "1D3D5B")

        subscriptionSuccessDescriptionLbl.font = UIFont(name: FontName.satoshiLight, size: 18)
        subscriptionSuccessDescriptionLbl.textColor = UIColor(hex: "1D3D5B")

        letsGo.font = UIFont(name: FontName.satoshiBold, size: 32)
        letsGo.textColor = UIColor(hex: "FFFFFF")
    }

    // MARK: - Actions
    @IBAction private func letsGoBtnClicked(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}

