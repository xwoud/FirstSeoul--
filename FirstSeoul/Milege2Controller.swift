//
//  Milege2Controller.swift
//  FirstSeoul
//
//  Created by 김민희 on 2019. 9. 25..
//  Copyright © 2019년 김민희. All rights reserved.
//

import UIKit
import Foundation
import WebKit



class Mileage2Controller: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.request(url: "https://driving-mileage.seoul.go.kr/home/mileage/howtoetax.do?menuNo=1016")
    }
    
    
    
    // 현재 webView에서 받아온 URL 페이지를 로드한다.
    func request(url: String) {
        self.webView.load(URLRequest(url: URL(string: url)!))
        self.webView.navigationDelegate = self
        
    }
}
// searchBar에서 검색하면 searchBar에 입력된 주소를 요청한다.
extension Mileage2Controller: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.request(url: searchBar.text!)
        //다른곳을 터치하면 키보드가 내려갈 수 있도록 한다.
        self.view.endEditing(true)
    }
}

// 현재 웹페이지의 URL을 searchBar에 띄워준다.
extension Mileage2Controller: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.searchBar.text = webView.url?.absoluteString
    }
}

