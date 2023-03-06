//
//  SignUpViewController.swift
//  InstaCloneFirebase
//
//  Created by Nazlı Bekeç on 6.03.2023.
//

import UIKit
import Firebase
import FirebaseCore

class SignUpViewController: UIViewController {

    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if userText.text != "" && passwordText.text != "" {
            
            Auth.auth().createUser(withEmail: userText.text!, password : passwordText.text!) { authdata, error in
                
                if error != nil {
                    // Hata mesajını firebaseden çekiyoruz.
                    self.makeAlert(titleInput: "Hata", messageInput: error!.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "toVC", sender: nil)
                }
    
            }
            
        } else {
           makeAlert(titleInput: "Hata", messageInput: "E-posta/Şifre alanı boş olamaz!")
        }
    }
    
        func makeAlert(titleInput: String, messageInput: String){
            let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default)
            alert.addAction(okButton)
            self.present(alert, animated: true)
        }
    }
  

