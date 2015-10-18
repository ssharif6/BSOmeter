//
//  PhotoAnalysisViewController.swift
//  BSOmeter
//
//  Created by Shaheen Sharifian on 10/17/15.
//  Copyright © 2015 Dubhacks. All rights reserved.
//

import UIKit

class PhotoAnalysisViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var didCameraLoad: Bool = false
    
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
