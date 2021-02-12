//
//  ViewController.swift
//  alex_preexamen
//
//  Created by Mac10 on 11/02/21.
//  Copyright © 2021 Mac10. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var aflm_TF_usuario: UITextField!
    @IBOutlet weak var aflm_TF_password: UITextField!
    @IBOutlet weak var aflm_Blogin: UIButton!
    
    
    override func viewDidLoad() {
        aflm_Blogin.layer.cornerRadius = aflm_Blogin.bounds.height/2
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func saveUsers(_ sender: UIButton) {
        if !aflm_TF_usuario.text!.isEmpty && !aflm_TF_password.text!.isEmpty{
            
            self.alertDefault(for: "Usuario agregado", and: "Se agrego el usuario correctamente")
            }
        else{
            sender.shake()
        }
    }
    

}
extension UIViewController {
    
    func alertDefault(for title: String, and description: String){
        
        
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in alert.dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension UIView{
    func shake(duration: TimeInterval = 0.5, xValue: CGFloat = 12, yValue: CGFloat = 0){
        self.transform = CGAffineTransform(translationX: xValue, y: yValue)
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}

