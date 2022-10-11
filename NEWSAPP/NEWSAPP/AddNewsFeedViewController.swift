//
//  AddNewsFeedViewController.swift
//  NEWSAPP
//
//  Created by Rishabh Sharma on 19/03/22.
//

import UIKit

class AddNewsFeedViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate{
    
    
    @IBOutlet weak var newsFieldAddButton: UIButton!
    @IBOutlet weak var newsFieldFullDesc: UITextView!
    @IBOutlet weak var newsFieldShortDesc: UITextView!
    @IBOutlet weak var newsFeedTitle: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var newsFeedImageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateTextField.delegate = self
        newsFieldShortDesc.delegate = self
        newsFieldFullDesc.delegate = self
        newsFeedTitle.delegate = self
        self.createpicker()
        self.newsFeedImageView.image = UIImage(named: "Standardapplenews"  )

        let tapGuesture2 = UITapGestureRecognizer(target: self, action: #selector(self.imageViewTapped2(_ :)))
        tapGuesture2.numberOfTapsRequired = 1
        newsFeedImageView.addGestureRecognizer(tapGuesture2)

    }
    
        @objc func imageViewTapped2(_ imageView: UIImage){

        let alert = UIAlertController(title: "Alert", message: "Choose wher you want to select image from", preferredStyle: UIAlertController.Style.actionSheet)
            let okayButton = UIAlertAction(title: "Photo Library", style: UIAlertAction.Style.default) { action in
            let choose  = UIImagePickerController()
            choose.sourceType = .photoLibrary
            choose.allowsEditing = true
            choose.delegate = self
            self.present(choose, animated: true ,completion: nil)
        }
        let okayButton2 = UIAlertAction(title: "Remove", style: UIAlertAction.Style.default) { action in
            self.newsFeedImageView.image = UIImage(named: "Standardapplenews"  )
            
        
    }
        
              
        if newsFeedImageView.image == UIImage(named: "Standardapplenews"  )
        {
            alert.addAction(okayButton)
        }
        else
        {
            alert.addAction(okayButton)
            alert.addAction(okayButton2)

        }



        
        let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) { action in
                  print("Alert okay button clicked")
        }
        alert.addAction(cancelButton)
        self.present(alert , animated: true , completion: nil)

        
    }

    

    @IBAction func newsFieldAddButton(_ sender: Any) {
        if newsFeedTitle.text!.isEmpty {
            let message : String = " "
            let alertController:UIAlertController = UIAlertController(title: "Title is empty", message: message, preferredStyle: UIAlertController.Style.alert)
                    
            let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive, handler:nil)
                    
                    alertController.addAction(alertAction)
                    present(alertController, animated: true, completion: nil)
            
        }
        else if newsFieldShortDesc.text.isEmpty {
            let message : String = " "
            let alertController:UIAlertController = UIAlertController(title: "Short Discription is empty", message: message, preferredStyle: UIAlertController.Style.alert)
                    
            let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive, handler:nil)
                    
                    alertController.addAction(alertAction)
                    present(alertController, animated: true, completion: nil)
            
        }
        else if newsFieldFullDesc.text.isEmpty {
            let message : String = " "
            let alertController:UIAlertController = UIAlertController(title: "Full Discription is empty", message: message, preferredStyle: UIAlertController.Style.alert)
                    
            let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive, handler:nil)
                    
                    alertController.addAction(alertAction)
                    present(alertController, animated: true, completion: nil)
            
        }
        else if dateTextField.text!.isEmpty {
            let message : String = " "
            let alertController:UIAlertController = UIAlertController(title: "Date is empty", message: message, preferredStyle: UIAlertController.Style.alert)
                    
            let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive, handler:nil)
                    
                    alertController.addAction(alertAction)
                    present(alertController, animated: true, completion: nil)
        }
        else{
            
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "dd/MM/yyyy"
            addNews1.append(AddNews(title: newsFeedTitle.text ?? " ", ShortDescription: newsFieldShortDesc.text ?? " ", LongDescription: newsFieldFullDesc.text ?? " ", isFav: false, imageName: newsFeedImageView.image!, date: dateTextField.text ?? " ", originalDate: dateFormater.date(from: dateTextField.text!)))
            recent = addNews1.sorted(by: {$0.originalDate?.compare($1.originalDate!) == .orderedDescending})
            dictSort = Dictionary(grouping: addNews1) {(news) -> String in
                return news.date
            }
            
            
            
                    let message : String = " "
            let alertController:UIAlertController = UIAlertController(title: "News Added", message: message, preferredStyle: UIAlertController.Style.alert)
    
            let alertAction:UIAlertAction = UIAlertAction(title: "Done", style: UIAlertAction.Style.destructive, handler:nil)
    
                    alertController.addAction(alertAction)
                    present(alertController, animated: true, completion: nil)
            newsFeedTitle.text = nil
            newsFieldFullDesc.text = nil
            newsFieldShortDesc.text = nil
            newsFeedImageView.image = UIImage(named: "Standardapplenews"  )
            dateTextField.text = nil
            
            
        }
        
        }
        
        
        
       
    func addValues () {
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
          picker.dismiss(animated: true , completion: nil)
        
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newsFeedImageView.contentMode = .scaleAspectFill
            newsFeedImageView.image = pickedImage
            }
    }
}
extension AddNewsFeedViewController{
    
func createpicker()
    {
        
     let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        dateTextField.inputView = datePicker
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelclick))
        let done = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneclick))
        let flexible  = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([cancel , flexible ,done], animated: false)
        dateTextField.inputAccessoryView = toolbar
        datePicker.preferredDatePickerStyle  = .wheels
        
        
    }
    
   @objc func cancelclick()
    {
        dateTextField.resignFirstResponder()
    }
   @objc func doneclick()
    {
        if let datePicker = dateTextField.inputView as? UIDatePicker{
           let dateFormat = DateFormatter()
            
            
            dateFormat.dateStyle = DateFormatter.Style.short
            dateFormat.dateFormat = "dd/MM/yyyy "
            dateFormat.locale = Locale(identifier: "en_US_POSIX")
            dateFormat.timeZone = TimeZone(identifier: "UTC")!
            
            
            dateTextField.text = dateFormat.string(from: datePicker.date)
            
        }
        
        dateTextField.resignFirstResponder()
        
    }
    
  
  
}
//let sortedArray = addNews1{dateFormat.date(from: $0)! >dateFormat.date(from: $1)!}
extension AddNewsFeedViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard let textFieldText = textField.text,
                let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                    return false
            }
            let substringToReplace = textFieldText[rangeOfTextToReplace]
            let count = textFieldText.count - substringToReplace.count + string.count
            return count <= 80
        }
}
extension AddNewsFeedViewController : UITableViewDelegate
{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            if text == "\n" {
                textView.resignFirstResponder()
            }
            let wordCount = newsFieldShortDesc.text.split(separator: " ")
            return wordCount.count < 100
        }

}
