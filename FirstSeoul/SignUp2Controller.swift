//
//  SignUpController.swift
//  FirstSeoul
//
//  Created by 김민희 on 2019. 9. 26..
//  Copyright © 2019년 김민희. All rights reserved.
//

import UIKit
import Foundation
import WebKit

class SignUp2Controller: UIViewController {
    
        @IBOutlet var signView: UIView!
        @IBOutlet weak var idText: UITextField! //id
        @IBOutlet weak var pw1Text: UITextField! //비번
        @IBOutlet weak var pw2Text: UITextField! // 비번확인
        @IBOutlet weak var nameText: UITextField! // 이름
        
        // 취소버튼
        @IBAction func touchUpCancleButton(_ sender: UIButton) {
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        }

        
        @IBAction func SignUpClick(_ sender: UIButton) {//가입하기 버튼 눌렀을때
            let valid_elements:[String:UITextField] = ["id":self.idText,"비밀번호":self.pw1Text,"비밀번호 확인":self.pw2Text,"이름":self.nameText]
            var empty_elements = Array<String>()
            for (title,elm) in valid_elements {
                if elm.text == "" {
                    empty_elements.append(title)
                }
            }
            if empty_elements.count > 0 { // 항목이 비었을때
                let message = empty_elements.joined(separator: ",") + "\n" +  "항목을 채워주세요"
                let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
                // action애 실행코드에 추가해줄 코드
                let ok = UIAlertAction(title: "확인", style: .default) { (ok) in
                    
                }
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
                //self.idText.becomeFirstResponder()
                return
            } else { // 항목이 다 채워졌을때
                
                if pw1Text.text != pw2Text.text { // 비밀번호와 비밀번호 확인이 다를때
                    let alert = UIAlertController(title: "", message: "비밀번호가 일치하지 않습니다", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "확인", style: .default) { (ok) in
                    }
                    alert.addAction(ok)
                    self.present(alert, animated: true, completion: nil)
                    return
                } else {
                    okAlert()
                    
                }
            }
    }
    

        override func viewDidLoad() {
            super.viewDidLoad()
            signView.layer.cornerRadius = 7
            //signView.layer.borderWidth = 1
            // Do any additional setup after loading the view.
        }
    func okAlert() {
        let alert = UIAlertController(title: "", message: "가입이 완료되었습니다 ^^", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default) { (ok) in
            self.presentingViewController?.dismiss(animated: true, completion: nil)
            // 확인 누르면 처음 페이지로 돌아가기
        }
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
        


    }
