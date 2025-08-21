import UIKit

class PremiumSubscriptionTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var mainPlanLbl: UILabel!
    @IBOutlet weak var secondaryPlanLbl: UILabel!
    @IBOutlet weak var orignalPriceLbl: UILabel!
    @IBOutlet weak var planDescriptionLbl: UILabel!
    @IBOutlet weak var selectionImg: UIImageView!
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var bestValueImg: UIImageView!

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none

        mainPlanLbl.font = UIFont(name: FontName.satoshiMedium, size: 18)
        mainPlanLbl.textColor = UIColor(hex: "BD4848")

        secondaryPlanLbl.font = UIFont(name: FontName.satoshiMedium, size: 18)
        secondaryPlanLbl.textColor = UIColor(hex: "1D3D5B")

        orignalPriceLbl.font = UIFont(name: FontName.satoshiMedium, size: 18)
        orignalPriceLbl.textColor = UIColor(hex: "1D3D5B")
        applyStrikeThrough(to: orignalPriceLbl)

        planDescriptionLbl.font = UIFont(name: FontName.satoshiRegular, size: 12)
    }

    // MARK: - Helpers
    private func applyStrikeThrough(to label: UILabel) {
        if let text = label.text {
            let attributeString = NSMutableAttributedString(string: text)
            attributeString.addAttribute(
                .strikethroughStyle,
                value: NSUnderlineStyle.single.rawValue,
                range: NSMakeRange(0, attributeString.length)
            )
            label.attributedText = attributeString
        }
    }
}

