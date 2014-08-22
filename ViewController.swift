//
//  ViewController.swift
//  iOSChallenge-003
//
//  Created by Brian Hynds on 8/21/14.
//  Copyright (c) 2014 Brian C. Hynds. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    
    @IBAction func goButtonPressed(sender: UIButton) {
        loadURLAddress(processURLString(urlBar.text))
        urlBar.resignFirstResponder()
    }
    
    @IBAction func backButtonPressed(sender: UIButton) {
        webView.goBack()
    }
    
    @IBAction func forwardButtonPressed(sender: UIButton) {
        webView.goForward()
    }
    
    @IBOutlet weak var webView: UIWebView!
    
    
    @IBOutlet weak var urlBar: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        urlBar.delegate = self
        
        // Load the URL from the URL bar and display it
        // If blank (first load), use default (google.com)
        webView.delegate = self
        var urlPath = urlBar.text
        
        if countElements(urlPath) == 0 {
            urlPath = "http://www.google.com"
        }
        
        // Display the page (if possible)
        loadURLAddress(urlPath)
        
    }
    
    func processURLString(var urlString: String)->String {
        if urlString.hasPrefix("http://") {
            return urlString
        } else {
            urlString = "http://" + urlString
            return urlString
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadURLAddress(urlString: String) {
        var requestURL = NSURL(string: urlString)
        var request = NSURLRequest(URL: requestURL)
        webView.loadRequest(request)
        urlBar.text = urlString
        
        
        println("Loaded address: \(requestURL)")
    }
    
    func webView(webView: UIWebView!, didFailLoadWithError error: NSError!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        println("Error: \(error)")
    }
    
    func updateButtons() {
        backButton.enabled = webView.canGoBack
        forwardButton.enabled = webView.canGoForward
    }
    
    func webViewDidStartLoad(webView: UIWebView!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        updateButtons()
    }
    
    func webViewDidFinishLoad(webView: UIWebView!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        updateButtons()
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        if textField == urlBar {
            loadURLAddress(processURLString(urlBar.text))
        }
        urlBar.resignFirstResponder()
        return true
    }

}

