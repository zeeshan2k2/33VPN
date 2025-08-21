import UIKit

class HomeViewController: BaseViewController {
    // MARK: - Outlets
    @IBOutlet weak var vpnTitleLbl: UILabel!
    @IBOutlet weak var settingsBtn: UIButton!
    @IBOutlet weak var selectedServerLbl: UILabel!
    @IBOutlet weak var selectedServerCountryImg: UIImageView!
    @IBOutlet weak var selectedServerIPLbl: UILabel!
    @IBOutlet weak var connectionBtn: UIButton!
    @IBOutlet weak var connectionStatusLbl: UILabel!
    @IBOutlet weak var connectionStatusImg: UIImageView!
    @IBOutlet weak var connectionDurationLbl: UILabel!
    @IBOutlet weak var bottomSheetContainerView: UIView!
    @IBOutlet weak var bottomSheetHeightConstraint: NSLayoutConstraint!

    // MARK: - Bottom Sheet Heights
    let collapsedHeight: CGFloat = 210
    var expandedHeight: CGFloat {
        return view.frame.height - view.safeAreaInsets.top
    }

    // MARK: - Views
    let grabberView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.85, alpha: 1)
        view.layer.cornerRadius = 2.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Lifecycle
    override func setInitailUi() {
        view.backgroundColor = .white
        configureUIComponents()
        setupBottomSheet()
        addPanGesture()
        for family in UIFont.familyNames {
            print("Family: \(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("   Font: \(name)")
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - UI Setup
    func configureUIComponents() {
        vpnTitleLbl.font = UIFont(name: FontName.satoshiVariableBoldItalic, size: 24)
        vpnTitleLbl.textColor = UIColor(hex: "1D3D5B")

        let size = min(selectedServerCountryImg.frame.width, selectedServerCountryImg.frame.height)
        selectedServerCountryImg.layer.cornerRadius = size / 2
        selectedServerCountryImg.clipsToBounds = true

        selectedServerIPLbl.textColor = UIColor(hex: "1D3D5B")

        selectedServerLbl.font = UIFont(name: FontName.satoshiBold, size: 17)
        connectionStatusLbl.font = UIFont(name: FontName.satoshiLight, size: 17)
        connectionDurationLbl.font = UIFont(name: FontName.satoshiBold, size: 26)
        connectionDurationLbl.textColor = UIColor(hex: "66B8FC")
        bottomSheetContainerView.layer.cornerRadius = 15
    }

    // MARK: - Actions
    @IBAction func settingsBtnClicked(_ sender: UIButton) {
        print("Settings button clicked")
        navigateToVC(SettingsViewController.self)
    }

    // MARK: - Bottom Sheet Setup
    func setupBottomSheet() {
        bottomSheetContainerView.addSubview(grabberView)
        NSLayoutConstraint.activate([
            grabberView.topAnchor.constraint(equalTo: bottomSheetContainerView.topAnchor, constant: 14),
            grabberView.centerXAnchor.constraint(equalTo: bottomSheetContainerView.centerXAnchor),
            grabberView.widthAnchor.constraint(equalToConstant: 40),
            grabberView.heightAnchor.constraint(equalToConstant: 5)
        ])

        let headerContainer = UIView()
        headerContainer.backgroundColor = .white
        headerContainer.translatesAutoresizingMaskIntoConstraints = false
        bottomSheetContainerView.addSubview(headerContainer)

        let countriesLbl = UILabel()
        countriesLbl.text = "Countries"
        countriesLbl.font = UIFont(name: FontName.satoshiBold, size: 17)
        countriesLbl.textColor = UIColor(hex: "1D3D5B")
        countriesLbl.translatesAutoresizingMaskIntoConstraints = false

        let accessSpeedLbl = UILabel()
        accessSpeedLbl.text = "Access speed"
        accessSpeedLbl.font = UIFont(name: FontName.satoshiVariableBoldLight, size: 13)
        accessSpeedLbl.textColor = .lightGray
        accessSpeedLbl.translatesAutoresizingMaskIntoConstraints = false

        headerContainer.addSubview(countriesLbl)
        headerContainer.addSubview(accessSpeedLbl)

        NSLayoutConstraint.activate([
            headerContainer.topAnchor.constraint(equalTo: grabberView.bottomAnchor, constant: 4),
            headerContainer.leadingAnchor.constraint(equalTo: bottomSheetContainerView.leadingAnchor),
            headerContainer.trailingAnchor.constraint(equalTo: bottomSheetContainerView.trailingAnchor),
            headerContainer.heightAnchor.constraint(equalToConstant: 44)
        ])

        NSLayoutConstraint.activate([
            countriesLbl.leadingAnchor.constraint(equalTo: headerContainer.leadingAnchor, constant: 18),
            countriesLbl.centerYAnchor.constraint(equalTo: headerContainer.centerYAnchor),
            accessSpeedLbl.trailingAnchor.constraint(equalTo: headerContainer.trailingAnchor, constant: -18),
            accessSpeedLbl.centerYAnchor.constraint(equalTo: headerContainer.centerYAnchor)
        ])

        let serverListVC = ServerListViewController()
        addChild(serverListVC)
        bottomSheetContainerView.addSubview(serverListVC.view)
        serverListVC.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            serverListVC.view.topAnchor.constraint(equalTo: headerContainer.bottomAnchor),
            serverListVC.view.leadingAnchor.constraint(equalTo: bottomSheetContainerView.leadingAnchor),
            serverListVC.view.trailingAnchor.constraint(equalTo: bottomSheetContainerView.trailingAnchor),
            serverListVC.view.bottomAnchor.constraint(equalTo: bottomSheetContainerView.bottomAnchor)
        ])

        serverListVC.didMove(toParent: self)
    }

    // MARK: - Pan Gesture
    func addPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        bottomSheetContainerView.addGestureRecognizer(panGesture)
    }

    // MARK: - Pan Gesture Handler
    @objc private func handlePan(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: view)
        let velocity = recognizer.velocity(in: view)

        switch recognizer.state {
        case .changed:
            let newHeight = bottomSheetHeightConstraint.constant - translation.y
            bottomSheetHeightConstraint.constant = max(min(newHeight, expandedHeight), collapsedHeight)
            recognizer.setTranslation(.zero, in: view)

        case .ended:
            let targetHeight: CGFloat = (velocity.y < 0) ? expandedHeight : collapsedHeight

            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: velocity.y / 1000,
                           options: .curveEaseOut,
                           animations: {
                self.bottomSheetHeightConstraint.constant = targetHeight
                self.view.layoutIfNeeded()
            }, completion: { _ in
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
            })

        default:
            break
        }
    }
}

