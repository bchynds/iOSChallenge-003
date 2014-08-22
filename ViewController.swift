//
//  ViewController.swift
//  iOSChallenge-003
//
//  Created by Brian Hynds on 8/21/14.
//  Copyright (c) 2014 Brian C. Hynds. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    @IBAction func goButtonPressed(sender: UIButton) {
        
    }
    @IBAction func backButtonPressed(sender: UIButton) {
        
    }
    @IBAction func forwardButtonPressed(sender: UIButton) {
        
    }
    
    @IBOutlet weak var webView: UIWebView!
    
    
    @IBOutlet weak var urlBar: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Load the URL from the URL bar and display it
        
        webView.delegate = self
        var urlPath = "http://www.google.com"
        loadURLAddress(urlPath)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadURLAddress(url: String) {
        var requestURL = NSURL(string: url)
        var request = NSURLRequest(URL: requestURL)
        webView.loadRequest(request)
        
        println("Loaded address: \(requestURL)")
    }
    
    func webView(webView: UIWebView!, didFailLoadWithError error: NSError!) {
        println("Error: \(NSError.description())")
    }

}

