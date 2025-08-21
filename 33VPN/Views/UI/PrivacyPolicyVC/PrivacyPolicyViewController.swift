import UIKit

class PrivacyPolicyViewController: BaseViewController {
    // MARK: - Outlets
    @IBOutlet weak var privacyPolicyHeaderLbl: UILabel!
    @IBOutlet weak var privacyPolicyTitleLbl: UILabel!
    @IBOutlet weak var privacyPolicyDescriptionLbl: UILabel!
    @IBOutlet weak var informationCollectLbl: UILabel!
    @IBOutlet weak var informationCollectDescriptionLbl: UILabel!
    @IBOutlet weak var sharingInformationLbl: UILabel!
    @IBOutlet weak var sharingInformationDescriptionLbl: UILabel!

    // MARK: - Lifecycle
    override func setInitailUi() {
        setupFonts()
        setupTexts()
    }

    // MARK: - Actions
    @IBAction private func backBtnClicked(_ sender: Any) {
        popupVC()
    }

    // MARK: - Setup
    private func setupFonts() {
        let blue = UIColor(hex: "1D3D5B")
        privacyPolicyHeaderLbl.font = UIFont(name: FontName.satoshiMedium, size: 18)
        privacyPolicyHeaderLbl.textColor = blue

        privacyPolicyTitleLbl.font = UIFont(name: FontName.satoshiBold, size: 24)
        privacyPolicyTitleLbl.textColor = blue

        privacyPolicyDescriptionLbl.font = UIFont(name: FontName.satoshiMedium, size: 18)
        privacyPolicyDescriptionLbl.textColor = blue

        informationCollectLbl.font = UIFont(name: FontName.satoshiMedium, size: 18)
        informationCollectLbl.textColor = blue

        informationCollectDescriptionLbl.font = UIFont(name: FontName.satoshiRegular, size: 14)
        informationCollectDescriptionLbl.textColor = blue

        sharingInformationLbl.font = UIFont(name: FontName.satoshiMedium, size: 18)
        sharingInformationLbl.textColor = blue

        sharingInformationDescriptionLbl.font = UIFont(name: FontName.satoshiRegular, size: 14)
        sharingInformationDescriptionLbl.textColor = blue
    }

    private func setupTexts() {
        privacyPolicyHeaderLbl.text = "Privacy Policy"
        privacyPolicyTitleLbl.text = "Privacy Policy"
        privacyPolicyDescriptionLbl.text = """
            Your privacy is important to us. This Privacy Policy outlines how we collect, use, and protect your personal information when you use our services.
            """
        informationCollectLbl.text = "Information We Collect"
        let bullets = [
            "• Personal data you provide (e.g., name, email, contact details).",
            "• Data collected automatically (e.g., usage data, cookies, IP addresses)."
        ]
        informationCollectDescriptionLbl.attributedText = bulletPointText(bullets)
        sharingInformationLbl.text = "Sharing Your Information"
        sharingInformationDescriptionLbl.text = """
            We do not sell or share your personal information with third parties, except as necessary to provide our services or comply with legal obligations.
            """
    }

    // MARK: - Helpers
    private func bulletPointText(_ strings: [String]) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: FontName.satoshiRegular, size: 14)!,
            .foregroundColor: UIColor(hex: "1D3D5B"),
            .paragraphStyle: paragraphStyle
        ]
        return NSAttributedString(string: strings.joined(separator: "\n"), attributes: attributes)
    }
}

