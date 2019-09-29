//
//  CarViewController.swift
//  FirstSeoul
//
//  Created by 김민희 on 2019. 9. 26..
//  Copyright © 2019년 김민희. All rights reserved.
//

import UIKit
import Foundation
//rmfotjdkfjdkjf
class CarViewController: UIViewController {
    //넵ㅎ
    
    var addtext : String!
    //첫번째 상자
    @IBOutlet var allLabel: UILabel!
    //두번째 상자
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var addTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    //세번째 상자
    @IBOutlet var nowTextField: UITextField!
    @IBOutlet var okButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker?.maximumDate = Date()
        
    }
    @IBAction func lastClick(_ sender: UIButton){
        if nowTextField.text!.isEmpty || nowTextField.text == "0" {
            emptyAlert()
        }else{
            let addtext1 = addTextField.text
            let addtext2 = nowTextField.text
            let mile = Int(addtext2!)! - Int(addtext1!)!
            UserDefaults.standard.set(mile, forKey : "mile")
            
            endAlert()
        }
        
    }
    
    @IBAction func checkClick(_ sender: UIButton) {
        if addTextField.text!.isEmpty ||  addTextField.text == "0" {
            emptyAlert()
        }else {
            // 사용자가 설정한 날짜
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let one = formatter.string(from: datePicker.date)
            // string -> date
            let dateString:String = one
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
            
            let date:Date = dateFormatter.date(from: dateString)!
    
            
            // 현재 날짜
            let formatter1 = DateFormatter()
            formatter1.dateFormat = "yyyy-MM-dd"
            let two = formatter1.string(from: Date())
            // string -> date
            let dateString2:String = two
            let date2:Date = dateFormatter.date(from: dateString2)!
            
            
            // 두 날짜 사이를 달수로 계산
            let interval = date2.timeIntervalSince(date)
            var days = Int(interval / 86400)
            //print(days)
            var mon = days / 30
            var mons = days % 30
            if mons >= 15 { //15일 이하면 버리고 15일 이상이면 1달로 쳐주기
                mon += 1
            }
            // 누적주행거리 optional벗겨주기
            addtext = addTextField.text
            //print(addtext!) //계기판 뒤에와야할것
            
            if days <= 365 { // 자동차 탄지 1년 이하면 서울시 년간 누적주행거리로 계산함
                allLabel.text = String(327073)
            } else { // 자동차 탄지 1년 이상
                let all = ( Int(addtext!)! / mon ) * 12
                // 년간 누적주행거리 계산
                allLabel.text = String(all)
            }
            var c = String(self.allLabel.text!)
            let d = Int(c)
            UserDefaults.standard.set(d, forKey : "max")
            addButton.isEnabled = false //버튼 비활성화

        }
    
    }
    @IBAction func editClick(_ sender: UIButton) {
        addButton.isEnabled = true
    }
    
    
    func emptyAlert() {
        let alertController = UIAlertController(title: nil, message: "정확한 값을 입력해주세요", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    func endAlert() {
        let alertController = UIAlertController(title: nil, message: "설정 완료", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
       
    }
    func oneAlert() {
        let alertController = UIAlertController(title: nil, message: "등록 1년 미만 차량은 서울시 자동차 평균주행거리로 계산됩니다.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

          self.view.endEditing(true)

    }
    

}
