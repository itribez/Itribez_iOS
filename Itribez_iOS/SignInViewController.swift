import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var welcomeBackLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rememberMeCheckbox: UIButton!
    @IBOutlet weak var rememberMeLabel: UILabel!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupLabel: UILabel!
    @IBOutlet weak var googleLoginButton: UIButton!
    @IBOutlet weak var facebookLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customize the welcome label text
        welcomeBackLabel.text = "Welcome Back!"
        
        // Customize the "Don't have an account? Sign up" label as needed
        let attributedText = NSMutableAttributedString(string: "Don't have an account? Sign up")
        attributedText.addAttribute(.foregroundColor, value: UIColor.blue, range: NSRange(location: 23, length: 8)) // Change color of "Sign up"
        signupLabel.attributedText = attributedText
        
        googleLoginButton.layer.borderWidth = 1.0 // Border width in points
        googleLoginButton.layer.borderColor = UIColor.black.cgColor // Border color in black
        googleLoginButton.layer.cornerRadius = googleLoginButton.bounds.height / 2 // Make it a circular button
        googleLoginButton.clipsToBounds = true // Ensure the content stays within the rounded borders
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        // Validate the username and password
        let validUsername = "your_username"
        let validPassword = "your_password"
        
        guard let username = usernameTextField.text,
              let password = passwordTextField.text else {
            // Handle empty input fields
            return
        }
        
        if username == validUsername && password == validPassword {
            // Login successful, navigate to the next screen or perform desired action.
            print("Login successful!")
        } else {
            // Login failed, show an error message or alert.
            print("Login failed!")
        }
    }

    
    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
        // Implement the Google login logic here
        print("Google login tapped!")
    }
    
    @IBAction func facebookLoginButtonTapped(_ sender: UIButton) {
        // Implement the Facebook login logic here
        print("Facebook login tapped!")
    }
}
