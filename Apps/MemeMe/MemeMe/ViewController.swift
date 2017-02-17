//
//  ViewController.swift
//  MemeMe
//
//  Created by 신승훈 on 2017. 1. 28..
//  Copyright © 2017년 BoostCamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // MARK: IBOutlet
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var toolbar: UIToolbar!
    
    var meme: Meme?
    let memeMetextFieldDelegate = MemeMeTextFieldDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        initText()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initView()
    }
    override func viewWillDisappear(_ animated: Bool) {
        unsubscribeFromKeyboardNotifications()
        meme = nil
        self.tabBarController?.tabBar.isHidden = false
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        topTextField.resignFirstResponder()
        bottomTextField.resignFirstResponder()
    }
    
    
    // MARK: IBAction
    
    @IBAction func pickAnImageFromAlbum(_ sender: UIBarButtonItem) {
        meme = nil
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func pickAnImageFromCamera(_ sender: UIBarButtonItem) {
        meme = nil
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func shareAction(_ sender: UIBarButtonItem) {
        let memedImage = generateMemedImage()
        let controller = UIActivityViewController(activityItems: [memedImage], applicationActivities: nil)
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        Meme.save(topText: topTextField.text!, bottomText: bottomTextField.text!, originalImage: imageView.image!, memedImage: generateMemedImage(), now: Date() )
    }
    
    // MARK : ImagePicker Delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
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
    
    // MARK: make meme
    
    func generateMemedImage() -> UIImage {
        
        self.toolbar.isHidden = true
        
        // 화면 캡처
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        // 안보이게 했던 naviBar & toolBar 부분 자르기
        let navigationBarHeight = (self.navigationController?.navigationBar.frame.height)!
        let toolBarHeight = self.toolbar.frame.height
        let newHeight = self.view.frame.height - toolBarHeight - navigationBarHeight
        let rect = CGRect(x: 0, y: navigationBarHeight, width: self.view.frame.width, height: newHeight)
        let cropImage = memedImage.cgImage?.cropping(to: rect)
        
        self.toolbar.isHidden = false
        
        return UIImage(cgImage: cropImage!)
    }
    
    // textField 설정
    func initText() {
        
        let memeTextAttributes:[String:Any] = [
            NSForegroundColorAttributeName : UIColor.white,
            NSStrokeColorAttributeName : UIColor.black,    // outline
            NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 90)!,
            NSStrokeWidthAttributeName : -6 ] // 음수로 주어야한다!
        
        topTextField.defaultTextAttributes = memeTextAttributes
        bottomTextField.defaultTextAttributes = memeTextAttributes
        
        topTextField.textAlignment = .center
        bottomTextField.textAlignment = .center
        
        topTextField.delegate = memeMetextFieldDelegate
        bottomTextField.delegate = memeMetextFieldDelegate
    }
    
    // view 설정
    func initView() {
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        subscribeToKeyboardNotifications()
        
        // TableView나 CollectionView에서 전달해주는 이미지가 있다면..!
        if let meme = meme {
            self.imageView.image = meme.originalImage
            self.topTextField.text = meme.topText
            self.bottomTextField.text = meme.bottomText
        }
        if let _ = imageView.image {
            shareButton.isEnabled = true
            saveButton.isEnabled = true
        }else {
            shareButton.isEnabled = false
            saveButton.isEnabled = false
        }
        self.tabBarController?.tabBar.isHidden = true
    }
}
