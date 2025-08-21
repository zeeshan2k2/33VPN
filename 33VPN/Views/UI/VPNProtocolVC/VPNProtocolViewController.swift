import UIKit

class VPNProtocolViewController: BaseViewController {
    // MARK: - Outlets
    @IBOutlet weak var vpnProtocolHeaderLbl: UILabel!
    @IBOutlet weak var vpnProtocolPrimaryTitleLabel: UILabel!
    @IBOutlet weak var vpnProtocolSecondaryTitleLabel: UILabel!
    @IBOutlet weak var vpnProtocolDescriptionLbl: UILabel!
    @IBOutlet weak var vpnProtocolTableView: UITableView!

    // MARK: - Properties
    private let protocolOptions = [
        "Automatic Selection",
        "Alpha",
        "Beta",
        "Gamma",
        "Alpha with Obfuscation",
        "Beta with Obfuscation",
        "Gamma with Obfuscation"
    ]
    private var selectedIndexPath: IndexPath?

    // MARK: - Lifecycle
    override func setInitailUi() {
        vpnProtocolHeaderLbl.font = UIFont(name: FontName.satoshiMedium, size: 18)
        vpnProtocolPrimaryTitleLabel.font = UIFont(name: FontName.satoshiBold, size: 24)
        vpnProtocolSecondaryTitleLabel.font = UIFont(name: FontName.satoshiBold, size: 24)
        vpnProtocolDescriptionLbl.font = UIFont(name: FontName.satoshiRegular, size: 12)
        setTableView()
    }

    // MARK: - Setup
    private func setTableView() {
        vpnProtocolTableView.delegate = self
        vpnProtocolTableView.dataSource = self
        vpnProtocolTableView.separatorStyle = .none
        vpnProtocolTableView.rowHeight = 62
        vpnProtocolTableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    }

    // MARK: - Actions
    @IBAction private func backBtnClicked(_ sender: Any) {
        popupVC()
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension VPNProtocolViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return protocolOptions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "VPNProtocolTableViewCell",
            for: indexPath
        ) as? VPNProtocolTableViewCell else {
            return UITableViewCell()
        }

        let protocolName = protocolOptions[indexPath.row]
        cell.protocolNameLabel.text = protocolName

        let imageName = (selectedIndexPath == indexPath)
            ? "vpnProtocolSelectedCell"
            : "vpnProtocolCell"
        cell.protocolImageView.image = UIImage(named: imageName)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let previous = selectedIndexPath
        selectedIndexPath = indexPath

        var reloadPaths = [indexPath]
        if let prev = previous, prev != indexPath {
            reloadPaths.append(prev)
        }
        tableView.reloadRows(at: reloadPaths, with: .automatic)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 18
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 18
    }
}

