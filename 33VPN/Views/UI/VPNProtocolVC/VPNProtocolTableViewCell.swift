import UIKit

class VPNProtocolTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var protocolNameLabel: UILabel!
    @IBOutlet weak var protocolImageView: UIImageView!

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        let clearBgView = UIView()
        clearBgView.backgroundColor = .clear
        self.selectedBackgroundView = clearBgView
        protocolNameLabel.font = UIFont(name: FontName.satoshiVariableBoldMedium, size: 15)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

