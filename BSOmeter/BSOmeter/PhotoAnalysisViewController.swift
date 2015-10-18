//
//  PhotoAnalysisViewController.swift
//  BSOmeter
//
//  Created by Shaheen Sharifian on 10/17/15.
//  Copyright © 2015 Dubhacks. All rights reserved.
//

import UIKit
import SwiftyJSON

class PhotoAnalysisViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var didCameraLoad: Bool = false
    // OCR Settings
    let apikey = "4e21e91d-5107-43ed-8744-1797b084b002"
    var ocrImageUrl = "http://i.imgur.com/iG4ZCw7.jpg"
    let endpoint: NSURL = NSURL(string: "https://api.idolondemand.com/1/api/sync/ocrdocument/v1")!
    //Reading modes
    let mode1 = "&mode=document_photo"   //This is best for photos
    let mode2 = "&mode=document_scan"  //Best for scanned documents
    let mode3 = "&mode=scene_photo"  //Best for scenes
    
    var imageID = 1
    
    @IBOutlet weak var pictureImageview: UIImageView!
    var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.didCameraLoad = true
    
    }
    
    override func viewDidAppear(animated: Bool) {
        if didCameraLoad {
            imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .Camera
            self.didCameraLoad = false
            presentViewController(imagePicker, animated: true, completion: nil)

        } else {
            // Do nothing
        }
        
    }
    
//    func postAndGetResult() {
//        let request = NSMutableURLRequest(URL: endpoint)
//        request.HTTPMethod = "POST"
//        
//        //change mode here according to type of the image
//        let payload = "apikey=\(apikey)&url=\(ocrImageUrl)\(mode1)".dataUsingEncoding(NSUTF8StringEncoding)
//
//        let task = NSURLSession.sharedSession().uploadTaskWithRequest(request, fromData: payload) { (data, response, error) -> Void in
//            if let value = data {
//                do {
//                    let jsonObject: AnyObject = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
//                    
//                    let json = JSON(jsonObject)
//                    if let ocr_results = json["text_block"][0]["text"].string {
//                        print(ocr_results)
//                        
//                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                            self.textFromOCR.hidden = true
//                            self.textFromOCR.text = ocr_results
//                        })
//                    }
//                } catch let error as NSError {
//                    print("json error: \(error.localizedDescription)")
//                }
//            }
//        }
//        task.resume()
//    }
    
//    func downloadImage(fromUrl: NSString) {
//        let url:NSURL = NSURL(string: fromUrl as String)!
//        let request:NSURLRequest = NSURLRequest(URL: url)
//        let queue:NSOperationQueue = NSOperationQueue()
//        NSURLConnection.sendAsynchronousRequest(request, queue: queue) { (response, data, error) -> Void in
//            dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                self.textFromOCR.hidden = true
//                self.pictureImageview.image = UIImage(data: data!)
//            })
//        }
//        
//    }
    
    @IBAction func AnalyzeImageAction(sender: AnyObject) {
//        postAndGetResult()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func takePhoto(sender: AnyObject) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .Camera
        self.didCameraLoad = false
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        pictureImageview.contentMode = .ScaleAspectFit
        pictureImageview.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
    }
    func getImagefile() -> UIImage {
        if pictureImageview.image != nil {
            return pictureImageview.image!
        } else {
            return pictureImageview.image! // Change this to an error screen or something
        }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
