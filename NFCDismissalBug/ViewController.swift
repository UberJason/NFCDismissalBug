//
//  ViewController.swift
//  NFCDismissalBug
//
//  Created by Ji,Jason on 5/29/18.
//  Copyright © 2018 Capital One Labs. All rights reserved.
//

import UIKit
import CoreNFC

class ViewController: UIViewController {

    public var session: NFCNDEFReaderSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    @IBAction func startReading(_ sender: Any) {
        session?.invalidate()
        session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        session?.alertMessage = "Read the NFC tag."
        session?.begin()
    }

}

extension ViewController: NFCNDEFReaderSessionDelegate {
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("didInvalidate: \(error.localizedDescription)")
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        print("didDetect")
    }
    
    
}
