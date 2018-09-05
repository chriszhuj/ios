//
//  RegisController.swift
//  LoginView
//
//  Created by 衰公 on 2018/9/5.
//  Copyright © 2018年 chrisz. All rights reserved.
//

import UIKit

class RegisController: UIViewController {

    let SCREEN_SIZE = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let label = UILabel(frame: CGRect(x: 20, y: 100, width: SCREEN_SIZE.width-40, height: 60))
        label.font = UIFont.systemFont(ofSize: 23)
        label.text = "Regis page"
        label.textAlignment = .center
        self.view.addSubview(label)
        
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: SCREEN_SIZE.width/2-50, y: 220, width: 100, height: 30)
        btn.setTitle("Back", for: .normal)
        btn.addTarget(self, action: #selector(back), for: .touchUpInside)
        self.view.addSubview(btn)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func back(){
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
