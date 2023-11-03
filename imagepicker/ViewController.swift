//
//  ViewController.swift
//  imagepicker
//
//  Created by Ragulkumar K V on 02/08/23.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var openbutton: UIButton!
    @IBOutlet weak var closebutton: UIButton!
    
    let imagepicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        closebutton.isHidden = true
        image.layer.cornerRadius = image.frame.size.width/2
        image.clipsToBounds = true
        image.layer.borderColor = UIColor.brown.cgColor
        image.layer.borderWidth = 1
    }
    
    
    @IBAction func openbutton(_ sender: Any) {
        imagepicker.sourceType = .savedPhotosAlbum
        imagepicker.delegate = self
        self.present(imagepicker,animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        let picture = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        image.image = picture
        self.dismiss(animated: true, completion: nil)
        closebutton.isHidden = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func closebutton(_ sender: Any) {
        closebutton.isHidden = true
        image.image = nil
        
        }
    }
    
