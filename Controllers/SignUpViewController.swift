//
//  SignUpViewController.swift
//  play&LearnEnglish
//
//  Created by veysel on 22.05.2024.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameSurnameText: UITextField!
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    @IBOutlet weak var password2Text: UITextField!
    
    
    @IBOutlet weak var signUpLabelButton: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
           // Klavyeyi kapatmak için delegate'i belirle
           nameSurnameText.delegate = self
           emailText.delegate = self
           passwordText.delegate = self
           password2Text.delegate = self
       
        let signUpLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(signUpLabelTapped))
        signUpLabelButton.isUserInteractionEnabled = true
        signUpLabelButton.addGestureRecognizer(signUpLabelTapGesture)
       
    }
    
    
    @objc func signUpLabelTapped() {
        // Kullanıcıdan gelen bilgileri al
        guard let nameSurname = nameSurnameText.text, !nameSurname.isEmpty else {
            showAlert(message: "Lütfen adınızı ve soyadınızı giriniz.")
            return
        }
        
        guard let email = emailText.text, !email.isEmpty else {
            showAlert(message: "Lütfen E-postanızı girin.")
            return
        }
        
        guard let password = passwordText.text, !password.isEmpty else {
            showAlert(message: "Şifrenizi giriniz Lütfen.")
            return
        }
        
        guard let password2 = password2Text.text, !password2.isEmpty else {
            showAlert(message: "Lütfen şifrenizi tekrar girin.")
            return
        }
        
        // Şifrelerin eşleşip eşleşmediğini kontrol et
        guard password == password2 else {
            showAlert(message: "Parolalar uyuşmuyor.")
            return
        }
        
        // Eğer tüm kontroller başarılıysa segue yap
        performSegue(withIdentifier: "toMainPage2VC", sender: nil)
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    // Klavyeyi kapatma
      override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          self.view.endEditing(true)
      }
      
      // UITextFieldDelegate metodu
      func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          textField.resignFirstResponder()
          return true
      }
}
