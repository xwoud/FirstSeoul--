//
//  miseViewController.swift
//  FirstSeoul
//
//  Created by swuad_09 on 26/09/2019.
//  Copyright © 2019 김민희. All rights reserved.
//



import UIKit
import MBCircularProgressBar

class miseViewController : UIViewController, XMLParserDelegate, UIPickerViewDataSource,UIPickerViewDelegate {
    
    
    @IBOutlet weak var miseLabel: UILabel!
    @IBOutlet weak var jisuLabel: UILabel!
    @IBOutlet weak var gpsButton : UIButton!
    @IBOutlet weak var guPicker: UIPickerView!
    @IBOutlet weak var bangu:UIImageView!
    @IBOutlet weak var malLabel: UILabel!
    @IBOutlet weak var progressView : MBCircularProgressBarView!
    @IBOutlet weak var max : UILabel!
    
    var mile : Int?
    var maxmil : Int?
    var currentElement = ""
    var b = Mise()
    var MiseInfoArr = Array<Mise>()
    //구번호 저장하는 변수
    var gunumber = ""
    var guPickerData : [String] = ["강남구", "강동구", "강서구", "강북구", "관악구", "광진구", "구로구", "금천구", "노원구", "동대문구", "도봉구", "동장구", "마포구", "서대문구", "성동구", "성북구", "서초구", "송파구", "영등포구", "용산구", "양천구", "은평구", "종로구", "중구", "중랑구"]
    
    override func viewDidLoad() {
        
        guPicker.delegate = self
        progressView.value = 0
        super.viewDidLoad()
        
        
    }
    //progressbar animation
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.5) {
            //carview에서 받아오는 변수 값 넣기.
            self.mile = UserDefaults.standard.value(forKey: "mile") as? Int
            self.maxmil = UserDefaults.standard.value(forKey: "max") as? Int
            print("mile : \(self.mile)")
            print("max : \(self.maxmil)")
            
            if(self.mile != nil && self.maxmil != nil)  {
            print("mile : \(self.mile)")
            print("max : \(self.maxmil)")
                self.progressView.value = CGFloat(self.mile!)
                //self.progressView.maxValue = CGFloat(self.maxmil!)
                var c = Int(self.maxmil!)
                self.progressView.maxValue = CGFloat(c)
                self.max.text = String(c)
            }
            
        }
    }
    
    // 몇개씩 보여줄지
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) {
        if guPicker.selectedRow(inComponent: 0) == 0 {
            self.gpsButton.isEnabled = false
        }else {
            self.gpsButton.isEnabled = true
        }
    }
    // 총 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.guPickerData.count
    }
    
    // 보여줄내용
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.guPickerData[row]
    }
    
    
    
    @IBAction func clickButton(_ sender: UIButton) {
        let gu = guPicker.selectedRow(inComponent: 0)
        if guPickerData[gu] == "강남구" { gunumber = "111261"
        } else if guPickerData[gu] == "강동구" { gunumber = "111274"
        } else if guPickerData[gu] == "강북구" { gunumber = "111291"
        } else if guPickerData[gu] == "강서구" { gunumber = "111212"
        } else if guPickerData[gu] == "관악구" { gunumber = "111251"
        } else if guPickerData[gu] == "광진구" { gunumber = "111141"
        } else if guPickerData[gu] == "구로구" { gunumber = "111221"
        } else if guPickerData[gu] == "금천구" { gunumber = "111281"
        } else if guPickerData[gu] == "노원구" { gunumber = "111311"
        } else if guPickerData[gu] == "도봉구" { gunumber = "111171"
        } else if guPickerData[gu] == "동대문구" { gunumber = "111152"
        } else if guPickerData[gu] == "동작구" { gunumber = "111241"
        } else if guPickerData[gu] == "마포구" { gunumber = "111201"
        } else if guPickerData[gu] == "서대문구" { gunumber = "111191"
        } else if guPickerData[gu] == "서초구" { gunumber = "111262"
        } else if guPickerData[gu] == "성동구" { gunumber = "111142"
        } else if guPickerData[gu] == "성북구" { gunumber = "111161"
        } else if guPickerData[gu] == "송파구" { gunumber = "111273"
        } else if guPickerData[gu] == "양천구" { gunumber = "111301"
        } else if guPickerData[gu] == "영등포구" { gunumber = "111231"
        } else if guPickerData[gu] == "용산구" { gunumber = "111131"
        } else if guPickerData[gu] == "은평구" { gunumber = "111181"
        } else if guPickerData[gu] == "종로구" { gunumber = "111123"
        } else if guPickerData[gu] == "중구" { gunumber = "111121"
        } else if guPickerData[gu] == "중랑구" { gunumber = "111151"}
        
        let urlString = "http://openapi.seoul.go.kr:8088/4e6c737065656b643636564c726d54/xml/ListAirQualityByDistrictService/1/5/" + gunumber
        
        let xmlParser = XMLParser(contentsOf: URL(string: urlString)!)
        xmlParser!.delegate = self
        xmlParser!.parse()
        
        
    }
    

    
    
    // XML 파서가 시작 테그를 만나면 호출됨
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if(elementName == "row") {
            b = Mise()
        }
        
    }
    
    // 현재 테그에 담겨있는 문자열 전달
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if b.miseamount.isEmpty == true {
            switch currentElement {
            case "PM10" :
                b.miseamount = string
                miseLabel.text = b.miseamount
                
                
            default :
                break;
            }
            
        }
        if b.choamount.isEmpty == true {
            switch currentElement {
            case "PM25" :
                b.choamount = string
                
            default :
                break;
            }
        }
        if b.good.isEmpty == true {
        switch currentElement {
        case "GRADE" :
            b.good = string
            jisuLabel.text = b.good
            if jisuLabel.text == "좋음" {
                bangu.image = UIImage(named: "sky")
                malLabel.text = "오늘은 야외활동을 즐겨봐요"
            }
            else if jisuLabel.text == "보통" {
                bangu.image = UIImage(named: "green")
                malLabel.text = "오늘 하루도 화이팅 !"
            }
            else if jisuLabel.text == "나쁨" {
                bangu.image = UIImage(named: "orange")
                malLabel.text = "오늘은 대중교통을 이용해주세요"
            }
            else if jisuLabel.text == "매우나쁨" {
                bangu.image = UIImage(named: "red")
                malLabel.text = "오늘은 외출을 자제해주세요"
            }
            else { bangu.image = UIImage(named: "green")
                malLabel.text = "API 점검중입니다"
                
            }
            
        default :
            break;
            }
        }
        
        
    }
    
    // XML 파서가 종료 테그를 만나면 호출됨
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if(elementName == "row"){
            MiseInfoArr.append(b)
        }
    }
    
    
    
    
    
}

class Mise : NSObject {
    var good = String()
    var miseamount = String()
    var choamount = String()
}
