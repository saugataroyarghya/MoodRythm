//
//  LogInViewController.swift
//  MoodRhythms
//
//  Created by kuet on 12/11/23.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet var logo2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        passwordTextField.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    func setUpElements ()
    {
        errorLabel.alpha = 0
       
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func loginButtonTapped(_ sender: Any) {
        //Validate Text Fields
        
        let email = emailTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
        
        //Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) {(result, error)
            in
            if error != nil {
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else
            {
                let weatherViewController =   self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.weatherViewController) as? WeatherViewController
                
                self.view.window?.rootViewController = weatherViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
    @IBAction func gobck(_ sender: Any) {
        let ViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.ViewController) as? ViewController
        view.window?.rootViewController = ViewController
        view.window?.makeKeyAndVisible()
    }
}
