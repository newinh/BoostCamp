//
//  ViewController.swift
//  ImagePickerExperiment
//
//  Created by 신승훈 on 2017. 1. 20..
//  Copyright © 2017년 BoostCamp. All rights reserved.
//

import UIKit
import Photos

struct Meme {
    let topText : String
    let bottomText : String
    let originalImage: UIImage
    let memedImage: UIImage
}

class ViewController: UIViewController, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate, UITextFieldDelegate {

    // MARK: IBOutlet
    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    // MARK: ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topTextField.text = "TOP"
        bottomTextField.text = "BOTTOM"
        
        topTextField.textAlignment = NSTextAlignment.center
        bottomTextField.textAlignment = NSTextAlignment.center
        
        topTextField.textColor = UIColor.white
        bottomTextField.textColor = UIColor.white
        
        let memeTextAttributes:[String:Any] = [
            NSForegroundColorAttributeName : UIColor.white,
            NSStrokeColorAttributeName : UIColor.black,    // outline
            NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSStrokeWidthAttributeName : -8 ]
    
        topTextField.defaultTextAttributes = memeTextAttributes
        bottomTextField.defaultTextAttributes = memeTextAttributes
        
        topTextField.delegate = self
        bottomTextField.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeToKeyboardNotifications()
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        super.viewDidLoad()
        
        if let _ = imagePickerView.image {
            shareButton.isEnabled = true
            saveButton.isEnabled = true
        }else {
            shareButton.isEnabled = false
            saveButton.isEnabled = false
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
    // MARK: IBAction
    @IBAction func pickAnImageFromAlbum(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func shareAction(_ sender: Any) {
        let memedImage = generateMemedImage()
        let controller = UIActivityViewController(activityItems: [memedImage], applicationActivities: nil)
        present(controller, animated: true, completion: {
            self.imagePickerView.image = nil
            
        })
    }
    
    // MARK: UIImagePickerController Delegate
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {

        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imagePickerView.image = image
        }else {
            print("something went wrong")
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: TextFiledDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
     
        return true
    }
    
    // MARK: Keyboard
    
    func keyboardWillShow(_ notification: Notification) {
        view.frame.origin.y = 0 - getKeyboardHeight(notification)
    }
    func keyboardWillHide(_ notification: Notification){
        view.frame.origin.y = 0
    }
    
    func getKeyboardHeight(_ notification: Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
    }
    
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications(){
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    
    // MARK: save()
    @IBAction func save() {
        let meme = Meme(topText: topTextField.text!, bottomText: bottomTextField.text!, originalImage: imagePickerView.image!, memedImage:generateMemedImage())
        
        UIImageWriteToSavedPhotosAlbum(meme.memedImage, nil, nil, nil)
        
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.append(meme)
    }

    func generateMemedImage() -> UIImage {
        
        // TODO: Hide toolbar and navbar
        self.navigationController?.isToolbarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.toolbar.isHidden = true
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        // TODO: Show tollbar and navbar
        self.navigationController?.isToolbarHidden = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.toolbar.isHidden = false
        
        return memedImage
    }
}

