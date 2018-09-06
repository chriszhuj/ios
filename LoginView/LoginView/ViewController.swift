//
//  ViewController.swift
//  LoginView
//
//  Created by 衰公 on 2018/9/5.
//  Copyright © 2018年 chrisz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var loginText:UITextField?
    var passText:UITextField?
    
    let SCREEN_SIZE = UIScreen.main.bounds.size

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginText = UITextField(frame: CGRect(x: 20, y: 80, width: SCREEN_SIZE.width-40, height: 30))
        loginText?.borderStyle = .roundedRect
        loginText?.placeholder = "input username"
        
        let loginImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        loginImage.image = UIImage(named: "login_user")
        loginText?.leftView = loginImage
        loginText?.leftViewMode = .always
        
        passText = UITextField(frame: CGRect(x: 20, y: 130, width: SCREEN_SIZE.width-40, height: 30))
        passText?.borderStyle = .roundedRect
        passText?.placeholder = "input password"
        
        let passImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        passImage.image = UIImage(named: "login_pass")
        passText?.leftView = passImage
        passText?.leftViewMode = .always
        
        self.view.addSubview(loginText!)
        self.view.addSubview(passText!)
        
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: SCREEN_SIZE.width/4-50, y: 180, width: 100, height: 30)
        btn.setTitle("Login", for: .normal)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 10
        btn.backgroundColor = UIColor.cyan
        btn.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        let btn2 = UIButton(type: .system)
        btn2.frame = CGRect(x: SCREEN_SIZE.width/4*3-50, y: 180, width: 100, height: 30)
        btn2.setTitle("Regis", for: .normal)
        btn2.layer.masksToBounds = true
        btn2.layer.cornerRadius = 10
        btn2.backgroundColor = UIColor.cyan
        btn2.addTarget(self, action: #selector(regis), for: .touchUpInside)
        
        self.view.addSubview(btn)
        self.view.addSubview(btn2)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func login(){
        if loginText!.text!.isEmpty{
            let alertCon = UIAlertController(title: "Warnning", message: "name is required", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertCon.addAction(action)
            self.present(alertCon, animated: true, completion: nil)
            return
        }
        if passText!.text!.isEmpty{
            let alertCon = UIAlertController(title: "Warnning", message: "password is required", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertCon.addAction(action)
            self.present(alertCon, animated: true, completion: nil)
            return
        }
        let alertCon = UIAlertController(title: "Info", message: "Login success", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertCon.addAction(action)
        self.present(alertCon, animated: true, completion: nil)
        return
    }
    @objc func regis(){
        let regisController = RegisController()
        self.present(regisController, animated: true, completion: nil)
    }

}

