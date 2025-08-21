import Foundation
import UIKit

extension UIViewController {
    // MARK: - Navigation

    /// Pushes a view controller instantiated from the storyboard.
    /// The storyboard identifier must match the class name.
    func navigateToVC<T: UIViewController>(
        _ vc: T.Type,
        animated: Bool = true,
        withProperties: (_ vc: T) -> Void = { _ in }
    ) {
        let identifier = String(describing: vc)
        guard let vc = storyboard?.instantiateViewController(identifier: identifier) as? T else {
            fatalError("ViewController with identifier \(identifier) not found")
        }
        withProperties(vc)
        navigationController?.pushViewController(vc, animated: animated)
    }

    func navigateFromSplashToHome() {
        navigateToVC(HomeViewController.self) { homeVC in
            homeVC.title = "Home"
        }
    }

    func popupVC() {
        navigationController?.popViewController(animated: true)
    }

    func popupToVC(vcClass: AnyClass) {
        if let vc = navigationController?.viewControllers.last(where: { $0.isKind(of: vcClass) }) {
            navigationController?.popToViewController(vc, animated: true)
        }
    }

    func popupToRootVC() {
        navigationController?.popToRootViewController(animated: true)
    }

    func dismissVC() {
        dismiss(animated: true, completion: nil)
    }

    func createReverseTransition() {
        let transition = CATransition()
        transition.duration = 0.35
        transition.type = .push
        transition.subtype = .fromLeft
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        view.window?.layer.add(transition, forKey: kCATransition)
    }
}

