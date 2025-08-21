import UIKit

class SettingsTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var cellBgImg: UIView!
    @IBOutlet weak var title2Lbl: UILabel!
    @IBOutlet weak var subscriptionDetailsLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        cellBgImg.layer.cornerRadius = 10
        cellBgImg.clipsToBounds = true

        let clearBgView = UIView()
        clearBgView.backgroundColor = .clear
        selectedBackgroundView = clearBgView

        titleLbl.font = UIFont(name: FontName.satoshiRegular, size: 16)
        titleLbl.textColor = UIColor(hex: "1D3D5B")

        title2Lbl.font = UIFont(name: FontName.satoshiRegular, size: 16)
        subscriptionDetailsLbl.font = UIFont(name: FontName.satoshiRegular, size: 11)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

class PremiumTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var proTitleLbl: UILabel!
    @IBOutlet weak var proSubtitleLbl: UILabel!
    @IBOutlet weak var proIconImg: UIImageView!
    @IBOutlet weak var proArrowImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        let clearBgView = UIView()
        clearBgView.backgroundColor = .clear
        selectedBackgroundView = clearBgView

        proTitleLbl.font = UIFont(name: FontName.satoshiVariableBoldMedium, size: 22)
        proSubtitleLbl.font = UIFont(name: FontName.satoshiVariableBoldLight, size: 15)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

