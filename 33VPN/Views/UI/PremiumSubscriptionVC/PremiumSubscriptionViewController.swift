import UIKit

class PremiumSubscriptionViewController: BaseViewController {
    // MARK: - Outlets
    @IBOutlet weak var vpnTitleLbl: UILabel!
    @IBOutlet weak var subscriptionTitleLbl: UILabel!
    @IBOutlet weak var subscriptionDescriptionLbl: UILabel!
    @IBOutlet weak var subscriptionTrialLbl: UILabel!
    @IBOutlet weak var subscriptionSubscribeBtn: UIButton!
    @IBOutlet weak var subscriptionTableView: UITableView!
    @IBOutlet weak var termsConditionsLbl: UILabel!

    // MARK: - Properties
    private var selectedIndex: Int = 0

    // MARK: - Lifecycle
    override func setInitailUi() {
        vpnTitleLbl.font = UIFont(name: FontName.satoshiVariableBoldItalic, size: 24)
        vpnTitleLbl.textColor = UIColor(hex: "1D3D5B")

        subscriptionTitleLbl.font = UIFont(name: FontName.satoshiBold, size: 24)
        subscriptionTitleLbl.textColor = UIColor(hex: "1D3D5B")

        subscriptionDescriptionLbl.font = UIFont(name: FontName.satoshiRegular, size: 14)
        subscriptionDescriptionLbl.textColor = UIColor(hex: "1D3D5B")

        subscriptionTrialLbl.font = UIFont(name: FontName.satoshiRegular, size: 14)
        subscriptionTrialLbl.textColor = UIColor(hex: "1D3D5B")

        subscriptionSubscribeBtn.titleLabel?.font = UIFont(name: FontName.satoshiMedium, size: 18)
        subscriptionSubscribeBtn.setTitleColor(UIColor(hex: "1D3D5B"), for: .normal)

        termsConditionsLbl.font = UIFont(name: FontName.satoshiRegular, size: 12)
        termsConditionsLbl.textColor = UIColor(hex: "1D3D5B")

        setupTableView()
    }

    // MARK: - Setup
    private func setupTableView() {
        subscriptionTableView.delegate = self
        subscriptionTableView.dataSource = self
        subscriptionTableView.separatorStyle = .none
        subscriptionTableView.rowHeight = 75
        subscriptionTableView.estimatedRowHeight = 75
        subscriptionTableView.backgroundColor = .clear
    }

    // MARK: - Actions
    @IBAction func closeBtnClicked(_ sender: Any) {
        popupVC()
    }

    @IBAction func subscribeBtnClicked(_ sender: Any) {
        navigateToVC(PlanReadyViewController.self)
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension PremiumSubscriptionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "PremiumSubscriptionTableViewCell",
            for: indexPath
        ) as? PremiumSubscriptionTableViewCell else {
            return UITableViewCell()
        }

        let isSelected = indexPath.row == selectedIndex
        cell.selectionImg.image = UIImage(named: isSelected ? "checkCircleSelected" : "checkCircleUnselected")
        cell.backgroundImg.image = UIImage(named: isSelected ? "premiumSelectedCell" : "premiumCell")
        cell.bestValueImg.isHidden = indexPath.row != 0

        cell.mainPlanLbl.isHidden = true
        cell.orignalPriceLbl.isHidden = true
        cell.planDescriptionLbl.isHidden = true
        cell.secondaryPlanLbl.isHidden = true

        if indexPath.row == 0 {
            cell.mainPlanLbl.isHidden = false
            cell.orignalPriceLbl.isHidden = false
            cell.planDescriptionLbl.isHidden = false

            cell.mainPlanLbl.text = "1 year, $29.99"
            cell.orignalPriceLbl.text = "$47.88"
            cell.planDescriptionLbl.text = "Only $2.50/month"
        } else {
            cell.secondaryPlanLbl.isHidden = false
            cell.secondaryPlanLbl.text = "1 month, $3.99"
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let previousIndex = selectedIndex
        selectedIndex = indexPath.row
        let paths = [
            IndexPath(row: previousIndex, section: 0),
            indexPath
        ]
        tableView.reloadRows(at: paths, with: .automatic)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 16
    }
}

