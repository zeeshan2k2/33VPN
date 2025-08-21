import UIKit

class SettingsViewController: BaseViewController {
    // MARK: - Outlets
    @IBOutlet weak var settingsLbl: UILabel!
    @IBOutlet weak var settingsTableView: UITableView!

    // MARK: - Section Data
    private let sectionTitles = ["", "Account", "Feedback", "Other"]
    private let items: [[(icon: String, title: String)]] = [
        [
            (icon: "userImg", title: "Email@gmail.com"),
            (icon: "vpnProtocol", title: "VPN Protocol")
        ],
        [
            (icon: "supportImg", title: "Support / Contact Us")
        ],
        [
            (icon: "termsOfUseImg", title: "Term of Use"),
            (icon: "privacyPolicyImg", title: "Privacy Policy"),
            (icon: "deleteImg", title: "Delete data")
        ]
    ]

    // MARK: - Lifecycle
    override func setInitailUi() {
        super.setInitailUi()
        settingsLbl.font = UIFont(name: "SatoshiVariable-Bold", size: 32)
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        settingsTableView.separatorStyle = .none
        setupTableFooter()
    }

    @IBAction func backBtnClicked(_ sender: Any) {
        popupVC()
    }

    // MARK: - Footer Setup
    private func setupTableFooter() {
        let footerHeight: CGFloat = 50
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: settingsTableView.frame.width, height: footerHeight))
        footerView.backgroundColor = .clear

        let versionLabel = UILabel(frame: footerView.bounds)
        versionLabel.text = "V1.0.03"
        versionLabel.font = UIFont(name: FontName.satoshiRegular, size: 16)
        versionLabel.textAlignment = .center
        versionLabel.textColor = UIColor(hex: "1D3D5B")
        versionLabel.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(versionLabel)

        NSLayoutConstraint.activate([
            versionLabel.centerXAnchor.constraint(equalTo: footerView.centerXAnchor),
            versionLabel.centerYAnchor.constraint(equalTo: footerView.centerYAnchor)
        ])

        settingsTableView.tableFooterView = footerView
    }

    // MARK: - Delete Alert
    private func showDeleteDataAlert() {
        let alert = DeleteDataAlertView.instantiate()
        alert.frame = view.bounds
        alert.onCancel = { [weak alert] in
            alert?.dismiss()
        }
        alert.onDelete = { [weak alert] in
            print("Delete action performed")
            alert?.dismiss()
            // Add your delete logic here
        }
        view.addSubview(alert)
        alert.alpha = 0
        UIView.animate(withDuration: 0.25) {
            alert.alpha = 1
        }
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : items[section - 1].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PremiumTableViewCell", for: indexPath) as? PremiumTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as? SettingsTableViewCell else {
                return UITableViewCell()
            }
            let item = items[indexPath.section - 1][indexPath.row]
            cell.iconImg.image = UIImage(named: item.icon)
            if item.title == "Email@gmail.com" {
                cell.titleLbl.isHidden = true
                cell.title2Lbl.isHidden = false
                cell.subscriptionDetailsLbl.isHidden = false
                cell.title2Lbl.text = "Email@gmail.com"
                cell.subscriptionDetailsLbl.text = "subscription details"
            } else {
                cell.titleLbl.isHidden = false
                cell.title2Lbl.isHidden = true
                cell.subscriptionDetailsLbl.isHidden = true
                cell.titleLbl.text = item.title
            }
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section > 0 else { return nil }
        let headerView = UIView()
        headerView.backgroundColor = .clear

        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.text = sectionTitles[section]
        headerLabel.font = UIFont(name: "SatoshiVariable-Bold_Medium", size: 20)
        headerLabel.textColor = UIColor(hex: "1D3D5B")
        headerView.addSubview(headerLabel)

        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            headerLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 4),
            headerLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8)
        ])

        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 30
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch (indexPath.section, indexPath.row) {
        case (0, _):
            print("Get PRO version tapped")
            navigateToVC(PremiumSubscriptionViewController.self)
        case (1, 0):
            print("Email tapped")
        case (1, 1):
            navigateToVC(VPNProtocolViewController.self)
        case (2, _):
            navigateToVC(SupportViewController.self)
        case (3, 0):
            print("Term of Use tapped")
        case (3, 1):
            navigateToVC(PrivacyPolicyViewController.self)
        case (3, 2):
            showDeleteDataAlert()
        default:
            break
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 120 : 68
    }
}


