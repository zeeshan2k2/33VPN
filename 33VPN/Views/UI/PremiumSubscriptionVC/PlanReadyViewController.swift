import UIKit

class PlanReadyViewController: BaseViewController {
    // MARK: - Outlets
    @IBOutlet weak var vpnTitleLbl: UILabel!
    @IBOutlet weak var planTitleLbl: UILabel!
    @IBOutlet weak var planDescriptionLbl: UILabel!
    @IBOutlet weak var planPromoLbl: UILabel!
    @IBOutlet weak var planPromoDescriptionLbl: UILabel!
    @IBOutlet weak var subscribeBtn: UIButton!
    @IBOutlet weak var termsConditionsLbl: UILabel!

    // MARK: - Lifecycle
    override func setInitailUi() {
        vpnTitleLbl.font = UIFont(name: FontName.satoshiVariableBoldItalic, size: 24)
        vpnTitleLbl.textColor = UIColor(hex: "1D3D5B")

        planTitleLbl.font = UIFont(name: FontName.satoshiBold, size: 32)
        planTitleLbl.textColor = UIColor(hex: "1D3D5B")

        planDescriptionLbl.font = UIFont(name: FontName.satoshiRegular, size: 14)
        planDescriptionLbl.textColor = UIColor(hex: "1D3D5B")

        planPromoLbl.font = UIFont(name: FontName.satoshiMedium, size: 18)
        planPromoLbl.textColor = UIColor(hex: "1D3D5B")

        planPromoDescriptionLbl.font = UIFont(name: FontName.satoshiRegular, size: 14)
        planPromoDescriptionLbl.textColor = UIColor(hex: "1D3D5B")

        subscribeBtn.titleLabel?.font = UIFont(name: FontName.satoshiMedium, size: 18)
        subscribeBtn.setTitleColor(UIColor(hex: "1D3D5B"), for: .normal)

        termsConditionsLbl.font = UIFont(name: FontName.satoshiRegular, size: 12)
        termsConditionsLbl.textColor = UIColor(hex: "1D3D5B")
    }

    // MARK: - Actions
    @IBAction private func closeBtnClicked(_ sender: Any) {
        popupVC()
    }

    @IBAction private func subscribeBtnClicked(_ sender: Any) {
        navigateToVC(SubscriptionSuccessViewController.self)
    }
}

