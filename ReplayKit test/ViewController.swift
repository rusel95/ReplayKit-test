//
//  ViewController.swift
//  ReplayKit test
//
//  Created by Admin on 9/5/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import ReplayKit

class ViewController: UIViewController {

    let recorder = RPScreenRecorder.shared()
    
    @IBAction func recorderTapped(_ sender: Any) {
        recorder.isMicrophoneEnabled = true
        
        recorder.isCameraEnabled = true
        recorder.startRecording { (error) in
            if let error = error {
                print(error)
            }
        }
    }

    @IBAction func recorderStopped(_ sender: Any) {
        recorder.stopRecording { (previewViewController, error) in
            if error != nil {
                print(error!)
            } else {
                previewViewController?.previewControllerDelegate = self
                self.present(previewViewController!, animated: true, completion: { 
                    print("presented new VC")
                })
            }
        }
    }
}

extension ViewController: RPPreviewViewControllerDelegate {
    func previewControllerDidFinish(_ previewController: RPPreviewViewController) {
        self.dismiss(animated: true) { 
            print("dismissed new VC")
        }
    }
}
