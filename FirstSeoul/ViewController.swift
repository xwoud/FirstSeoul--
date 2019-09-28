//
//  ViewController.swift
//  FirstSeoul
//
//  Created by 김민희 on 2019. 9. 20..
//  Copyright © 2019년 김민희. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var idField: UITextField!
    @IBOutlet var pwField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 10
        
    }
    
    @IBAction func login() {
        guard let idText = idField.text else {
            return
        }
        
        guard let pwText = pwField.text else {
            return
        }
        
        if idText == "" && pwText == "" {
            successAlert()
            
        } else { // 형식은 지켰으나 정의해둔 id(email), password가 아닌 경우
            failedAlert()
        }
        
        
    }
    
    
    // alert 설정
    func failedAlert() {
        let alertController = UIAlertController(title: nil, message: "아이디와 비번을 확인해주세요.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func successAlert() {
        let alertController = UIAlertController(title: nil, message: "로그인에 성공하였습니다!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        //self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    
}
