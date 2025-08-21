import UIKit

final class DeleteDataAlertView: UIView {
    // MARK: - Outlets
    @IBOutlet private weak var blurBackgroundView: UIVisualEffectView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var cancelLabel: UILabel!
    @IBOutlet private weak var cancelView: UIView!
    @IBOutlet private weak var deleteLabel: UILabel!
    @IBOutlet private weak var deleteView: UIView!
    @IBOutlet private weak var cancelButton: UIButton!
    @IBOutlet private weak var deleteButton: UIButton!

    // MARK: - Properties
    var onCancel: (() -> Void)?
    var onDelete: (() -> Void)?

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configureBlurEffect()
        configureContainerView()
        configureLabels()
        configureButtons()
        configureActionViews()
    }

    // MARK: - Configuration
    private func configureBlurEffect() {
        let blurEffect = UIBlurEffect(style: .systemMaterial)
        blurBackgroundView.effect = blurEffect
        blurBackgroundView.alpha = 0.97
    }

    private func configureContainerView() {
        containerView.layer.cornerRadius = 16
        containerView.clipsToBounds = true
        containerView.backgroundColor = .white
    }

    private func configureLabels() {
        titleLabel.font = UIFont(name: FontName.satoshiBold, size: 20)
        titleLabel.textColor = UIColor(hex: "1D3D5B")

        messageLabel.font = UIFont(name: FontName.satoshiRegular, size: 14)
        messageLabel.textColor = UIColor(hex: "1D3D5B")

        cancelLabel.font = UIFont(name: FontName.satoshiMedium, size: 16)
        cancelLabel.textColor = UIColor(hex: "1D3D5B")

        deleteLabel.font = UIFont(name: FontName.satoshiMedium, size: 16)
        deleteLabel.textColor = UIColor(hex: "FFFFFF")
    }

    private func configureButtons() {
        cancelButton.showsTouchWhenHighlighted = false
        deleteButton.showsTouchWhenHighlighted = false
    }

    private func configureActionViews() {
        cancelView.layer.cornerRadius = 10
        cancelView.layer.borderWidth = 1
        cancelView.layer.borderColor = UIColor(hex: "0A1A1F").withAlphaComponent(0.1).cgColor

        deleteView.layer.cornerRadius = 10
        deleteView.backgroundColor = UIColor(hex: "BD4848")
    }

    // MARK: - Actions
    @IBAction private func cancelTapped(_ sender: UIButton) {
        animateTap { [weak self] in
            self?.onCancel?()
            self?.dismiss()
        }
    }

    @IBAction private func deleteTapped(_ sender: UIButton) {
        animateTap { [weak self] in
            self?.onDelete?()
            self?.dismiss()
        }
    }

    // MARK: - Helpers
    public func dismiss() {
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 0
        }) { _ in
            self.removeFromSuperview()
        }
    }

    private func animateTap(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.transform = .identity
                completion()
            }
        })
    }

    // MARK: - Static Methods
    static func instantiate() -> DeleteDataAlertView {
        let bundle = Bundle(for: DeleteDataAlertView.self)
        let nib = UINib(nibName: "DeleteDataAlertView", bundle: bundle)
        return nib.instantiate(withOwner: nil, options: nil).first as! DeleteDataAlertView
    }
}

