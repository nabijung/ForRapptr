//
//  LoginViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Take email and password input from the user
     *
     * 3) Use the endpoint and paramters provided in LoginClient.m to perform the log in
     *
     * 4) Calculate how long the API call took in milliseconds
     *
     * 5) If the response is an error display the error in a UIAlertController
     *
     * 6) If the response is successful display the success message AND how long the API call took in milliseconds in a UIAlertController
     *
     * 7) When login is successful, tapping 'OK' in the UIAlertController should bring you back to the main menu.
     **/
    
   
    // MARK: - Properties
    private var client: LoginClient?
    
    lazy var stackView: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 24
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [emailTextField, passwordTextField, loginButton].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    //MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: GeneralButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        backgroundImageStyle()
        
        stackViewStyle()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func backAction(_ sender: Any) {
        let mainMenuViewController = MenuViewController()
        self.navigationController?.pushViewController(mainMenuViewController, animated: true)
    }
    
    @IBAction func didPressLoginButton(_ sender: Any) {
        guard let email = emailTextField.text?.replacingOccurrences(of: " ", with: ""),
        let password = passwordTextField.text?.replacingOccurrences(of: " ", with: ""),
        !(email.isEmpty) && !(password.isEmpty) else {
            //handle error
            presentSimpleAlert(title: "Attention", message: "Please fill out all fields.")
            return
        }
        LoginClient.shared.login(email: email, password: password, completion: { timeInMilliseconds in
            //present sucess
            self.presentSimpleAlert(title: "Success", message: "It took \(timeInMilliseconds) milliseconds to log you in!")
        }, error: { errorMessage in
            //present error
            self.presentSimpleAlert(title: "Error", message: errorMessage ?? "An error has occurred.")
        })
    }
    
    func stackViewStyle(){
        view.addSubview(stackView)

        stackView.isUserInteractionEnabled = true

        let topBarHeight = UIApplication.shared.statusBarFrame.size.height +
                (self.navigationController?.navigationBar.frame.height ?? 0.0)

        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: topBarHeight + 64).isActive = true
        stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor).isActive = true

    }
    
    func backgroundImageStyle(){
        //BACKGROUND IMAGE
        let backgroundImage = UIImage(named: "img_login")
        let backgroundImageView = UIImageView(image: backgroundImage)
        
        view.addSubview(backgroundImageView)
        
        backgroundImageView.contentMode = UIView.ContentMode.scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
