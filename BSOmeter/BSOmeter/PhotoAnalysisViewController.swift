//
//  PhotoAnalysisViewController.swift
//  BSOmeter
//
//  Created by Shaheen Sharifian on 10/17/15.
//  Copyright © 2015 Dubhacks. All rights reserved.
//

import UIKit
import SwiftyJSON
import TesseractOCR

class PhotoAnalysisViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, G8TesseractDelegate {
    
    var didCameraLoad: Bool = false
//    @IBOutlet weak var pictureImageview: UIImageView!
//    var imagePicker: UIImagePickerController!

    //haha... butt
    @IBOutlet var takePicButt: UIButton!
    @IBOutlet var cancelButt: UIButton!
    @IBOutlet var confirmButt: UIButton!
    
    let transitionManager = TransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.didCameraLoad = true
        
        cancelButt.hidden = true
        cancelButt.enabled = false
        confirmButt.hidden = true
        confirmButt.enabled = false
        
        takePicButt.enabled = true
        takePicButt.hidden = false
        
        self.transitioningDelegate = self.transitionManager
    }
    override func shouldAutorotate() -> Bool {
        return false
    }
    override func viewDidAppear(animated: Bool) {
        if didCameraLoad {
//            imagePicker = UIImagePickerController()
//            imagePicker.delegate = self
//            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
//            imagePicker.cameraCaptureMode = .Photo
//            imagePicker.modalPresentationStyle = .FullScreen
//            self.didCameraLoad = false
//            presentViewController(imagePicker, animated: false, completion: nil)

        } else {
            // Do nothing
        }
    }
    
    
    @IBAction func AnalyzeImageAction(sender: AnyObject) {
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func takePhoto(sender: AnyObject) {
//        imagePicker = UIImagePickerController()
//        imagePicker.delegate = self
//        imagePicker.sourceType = .Camera
//        self.didCameraLoad = false
//        presentViewController(imagePicker, animated: true, completion: nil)
        showVerificationButts()
    }

    func showVerificationButts() {
        cancelButt.hidden = false
        cancelButt.enabled = true
        confirmButt.hidden = false
        confirmButt.enabled = true

        
        takePicButt.enabled = false
        takePicButt.hidden = true
        
        UIView.animateWithDuration(0.5, animations: {
            self.cancelButt.frame.origin.x-=120
            self.confirmButt.frame.origin.x+=120
            
            self.cancelButt.transform = CGAffineTransformMakeRotation(-6.2831853072)
            self.confirmButt.transform = CGAffineTransformMakeRotation(6.2831853072)
        })
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
//        imagePicker.dismissViewControllerAnimated(true, completion: nil)
//        pictureImageview.contentMode = .ScaleAspectFit
//        pictureImageview.image = info[UIImagePickerControllerOriginalImage] as? UIImage
//        let selectedPhoto = info[UIImagePickerControllerOriginalImage] as! UIImage
//        analyzePhoto(selectedPhoto)
    }
    
    func analyzePhoto(image: UIImage) {
        
        let tesseract: G8Tesseract = G8Tesseract(language: "eng+fra")
        tesseract.delegate = self
        tesseract.engineMode = .TesseractCubeCombined
        tesseract.pageSegmentationMode = .Auto
        tesseract.maximumRecognitionTime = 60.0
        tesseract.image = image.g8_blackAndWhite()
        tesseract.recognize()
        print(tesseract.recognizedText)
    }
    
//    func getImagefile() -> UIImage {
//        if pictureImageview.image != nil {
//            return pictureImageview.image!
//        } else {
//            return pictureImageview.image! // Change this to an error screen or something
//        }
//    }
    
}
