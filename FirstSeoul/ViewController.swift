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
    var id : String = ""
    var pw : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 10
    }
    
    

    @IBAction func login() {
       
        self.id = (UserDefaults.standard.value(forKey: "id") as? String)!
        self.pw = (UserDefaults.standard.value(forKey: "pw") as? String)!
        
        guard let idText = idField.text else {
            return
        }
        
        guard let pwText = pwField.text else {
            return
        }
        if idText == self.id && pwText == self.pw
        {
            successAlert()
            print("성공")
            print(idText)
            print(pwText)
        }
        else if idText == "" && pwText == ""
        {
            print("없어서 실패")
            print(idText)
            print(pwText)
            failedAlert()
            
        } else { // 형식은 지켰으나 정의해둔 id(email), password가 아닌 경우
            print("틀려서 실패")
            print(idText)
            print(pwText)
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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

          self.view.endEditing(true)

    }
    
    
    
    
}
