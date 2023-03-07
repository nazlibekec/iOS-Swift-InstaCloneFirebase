//
//  ViewController.swift
//  InstaCloneFirebase
//
//  Created by Nazlı Bekeç on 27.02.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
        
        
    }

    @IBAction func signInClicked(_ sender: Any) {
        
        if userText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: userText.text!, password : passwordText.text!) { authdata, error in
                if error != nil {
                    // Hata mesajını firebaseden çekiyoruz.
                    self.makeAlert(titleInput: "Hata", messageInput: error!.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
           makeAlert(titleInput: "Hata", messageInput: "E-posta/Şifre alanı boş olamaz!")
        }
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        performSegue(withIdentifier: "toSignUpVC", sender: nil)
    }
    
    func makeAlert(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}

