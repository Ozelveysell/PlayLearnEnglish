
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var startLabelButton: UILabel!
    
    
    @IBOutlet weak var myAccountLabelButton: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Make the labels tappable
                let startLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(startLabelTapped))
                startLabelButton.isUserInteractionEnabled = true
                startLabelButton.addGestureRecognizer(startLabelTapGesture)
                
                let myAccountLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(myAccountLabelTapped))
                myAccountLabelButton.isUserInteractionEnabled = true
                myAccountLabelButton.addGestureRecognizer(myAccountLabelTapGesture)
                
                // Round the corners of the labels
                startLabelButton.layer.cornerRadius = 10
                startLabelButton.layer.masksToBounds = true
                
                myAccountLabelButton.layer.cornerRadius = 10
                myAccountLabelButton.layer.masksToBounds = true
    }
    @objc func startLabelTapped() {
          performSegue(withIdentifier: "toMainPageVC", sender: nil)
       }
       
       @objc func myAccountLabelTapped() {
           
           performSegue(withIdentifier: "toSignUpVC", sender: nil)
       }

}

