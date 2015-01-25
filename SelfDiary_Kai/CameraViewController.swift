//
//  CameraViewController.swift
//  SelfDiary_Kai
//
//  Created by Gawain Tsao on 1/18/15.
//  Copyright (c) 2015 Gawain Tsao. All rights reserved.
//

import UIKit

import UIKit
import MediaPlayer
import MobileCoreServices
import CoreData

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    var newSelfie : Selfie?
    var moviePlayerController:MPMoviePlayerController?
    var image:UIImage?
    var lastChosenMediaType:String?
    
    // the picture
    @IBOutlet var imageView:UIImageView!
    
    // "Camera" button
    @IBOutlet var takePictureButton:UIButton!
    
    // touch somewhere else to signal end of editing
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        view.endEditing(true)
    }
    
    // MARK picture controls
    @IBAction func takePicture(sender: UIButton) {
        pickMediaFromSource(UIImagePickerControllerSourceType.Camera)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            takePictureButton.hidden = true
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        updateDisplay()
    }
    
    func updateDisplay() {
        if let mediaType = lastChosenMediaType {
            if mediaType == kUTTypeImage as NSString {
                imageView.image = image!
                imageView.hidden = false
                newSelfie?.photo = image!
                
                if moviePlayerController != nil {
                    moviePlayerController!.view.hidden = true
                }
            }
        }
    }
    
    func setMoviePlayerLayoutConstraints() {
        
    }
    
    func pickMediaFromSource(sourceType:UIImagePickerControllerSourceType) {
        let mediaTypes = UIImagePickerController.availableMediaTypesForSourceType(sourceType)!
        
        if UIImagePickerController.isSourceTypeAvailable(sourceType) && mediaTypes.count > 0 {
            let picker = UIImagePickerController()
            picker.mediaTypes = mediaTypes
            picker.delegate = self
            picker.allowsEditing = true
            picker.sourceType = sourceType
            
            presentViewController(picker, animated: true, completion: nil)
        }
        else {
            let alertController = UIAlertController(title: "Error accessing media", message: "Unsupported media source.", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
            alertController.addAction(okAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        lastChosenMediaType = info[UIImagePickerControllerMediaType] as? NSString
        
        if let mediaType = lastChosenMediaType {
            if mediaType == kUTTypeImage as NSString {
                image = info[UIImagePickerControllerEditedImage] as? UIImage
            }
        }
        
        picker.dismissViewControllerAnimated(true, nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController!) {
        picker.dismissViewControllerAnimated(true, nil)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        var descriptionView = segue.destinationViewController as DescriptionViewController
        // Pass the selected object to the new view controller.
        descriptionView.newSelfie = self.newSelfie
    }
    
}