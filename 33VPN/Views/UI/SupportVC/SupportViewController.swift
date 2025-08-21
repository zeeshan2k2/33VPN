import UIKit

class SupportViewController: BaseViewController, UITextViewDelegate {
    // MARK: - Outlets
    @IBOutlet weak var supportHeaderLbl: UILabel!
    @IBOutlet weak var supportTitleLbl: UILabel!
    @IBOutlet weak var supportTextView: UITextView!
    @IBOutlet weak var submitBtn: UIButton!

    // MARK: - Properties
    private let placeholderText = "  Message..."
    private var placeholderLabel: UILabel!

    // MARK: - Lifecycle
    override func setInitailUi() {
        supportTextView.layer.cornerRadius = 10
        setupFonts()
        setupTextViewPlaceholder()
        setupTapGestureToDismissKeyboard()
    }

    // MARK: - Setup
    private func setupFonts() {
        supportHeaderLbl.font = UIFont(name: FontName.satoshiMedium, size: 18)
        supportHeaderLbl.textColor = UIColor(hex: "1D3D5B")

        supportTitleLbl.font = UIFont(name: FontName.satoshiBold, size: 24)
        supportTitleLbl.textColor = UIColor(hex: "1D3D5B")

        supportTextView.font = UIFont(name: FontName.satoshiRegular, size: 14)
        supportTextView.textColor = UIColor(hex: "1D3D5B")
        supportTextView.backgroundColor = UIColor(hex: "FFFFFF")

        submitBtn.titleLabel?.font = UIFont(name: FontName.satoshiMedium, size: 18)
        submitBtn.setTitleColor(UIColor(hex: "FFFFFF"), for: .normal)
    }

    private func setupTextViewPlaceholder() {
        placeholderLabel = UILabel()
        placeholderLabel.text = placeholderText
        placeholderLabel.font = UIFont(name: FontName.satoshiRegular, size: 14)
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.sizeToFit()
        placeholderLabel.frame.origin = CGPoint(x: 5, y: 8)
        supportTextView.addSubview(placeholderLabel)
        supportTextView.delegate = self
    }

    private func setupTapGestureToDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    // MARK: - UITextViewDelegate
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }

    // MARK: - Actions
    @IBAction private func backBtnClicked(_ sender: Any) {
        popupVC()
    }
}

