import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        setInitailUi()
        setObservers()
    }
    
    deinit {
        // Avoid canceling the monitor here as it's shared
        print("BaseViewController deinitialized.")
    }
    
    // Subclass can override to add specific observers
    func setObservers() {}
    
    // Subclass can override to set up specific UI components
    func setInitailUi() {}
   
}
