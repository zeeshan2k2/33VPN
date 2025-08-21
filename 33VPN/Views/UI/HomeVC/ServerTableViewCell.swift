import UIKit

class ServerTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var countryImg: UIImageView!
    @IBOutlet weak var countryNameLbl: UILabel!
    @IBOutlet weak var ipLbl: UILabel!
    @IBOutlet weak var accessSpeedImg: UIImageView!

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        countryImg.layer.cornerRadius = countryImg.frame.width / 2
        countryImg.clipsToBounds = true

        let clearBgView = UIView()
        clearBgView.backgroundColor = .clear
        selectedBackgroundView = clearBgView

        countryNameLbl.font = UIFont(name: FontName.satoshiVariableBold, size: 16)
        ipLbl.font = UIFont(name: FontName.satoshiVariableBoldLight, size: 14)
    }
}

