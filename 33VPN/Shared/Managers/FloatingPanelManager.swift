import UIKit
import FloatingPanel

final class FloatingPanelManager: NSObject {
    static let shared = FloatingPanelManager()
    private var floatingPanel: FloatingPanelController?

    private override init() {
        super.init()
    }

    // MARK: - Present / Dismiss / Move

    /// Present FloatingPanel with the given content view controller.
    func present(on parentVC: UIViewController, contentViewController: UIViewController) {
        if let panel = floatingPanel {
            panel.removePanelFromParent(animated: false)
        }

        let fpc = FloatingPanelController()
        fpc.delegate = self
        fpc.set(contentViewController: contentViewController)

        fpc.surfaceView.layer.cornerRadius = 16
        fpc.surfaceView.layer.shadowColor = UIColor.black.cgColor
        fpc.surfaceView.layer.shadowOpacity = 0.3
        fpc.surfaceView.layer.shadowOffset = CGSize(width: 0, height: 2)
        fpc.surfaceView.layer.shadowRadius = 4
        fpc.surfaceView.grabberHandle.isHidden = false
        fpc.surfaceView.backgroundColor = .secondarySystemBackground

        fpc.addPanel(toParent: parentVC)
        fpc.move(to: .tip, animated: false)

        floatingPanel = fpc
    }

    /// Dismiss FloatingPanel.
    func dismiss(animated: Bool = true) {
        floatingPanel?.removePanelFromParent(animated: animated)
        floatingPanel = nil
    }

    /// Programmatically move to a given state.
    func move(to state: FloatingPanelState, animated: Bool = true) {
        floatingPanel?.move(to: state, animated: animated)
    }
}

// MARK: - FloatingPanelControllerDelegate
extension FloatingPanelManager: FloatingPanelControllerDelegate {
    func floatingPanelDidChangeState(_ fpc: FloatingPanelController) {
        print("🧩 FloatingPanel state changed: \(fpc.state)")
    }

    func floatingPanelWillBeginDragging(_ fpc: FloatingPanelController) {
        print("🧩 FloatingPanel will begin dragging")
    }

    func floatingPanelDidEndDragging(
        _ fpc: FloatingPanelController,
        withVelocity velocity: CGPoint,
        targetState: FloatingPanelState
    ) {
        print("🧩 FloatingPanel did end dragging to state: \(targetState)")
    }
}

