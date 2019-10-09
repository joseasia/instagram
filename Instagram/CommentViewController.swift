//
//  CommentViewController.swift
//  Instagram
//
//  Created by 佐藤　由羽太 on 2019/10/04.
//  Copyright © 2019 佐藤　由羽太. All rights reserved.
//

import UIKit
import Firebase

class CommentViewController: UIViewController{
    
    var comment = ""
    var postData : PostData!
    
    
    @IBOutlet weak var commentInputBox: UITextView!
    
    @IBAction func handlePostButton(_ sender: Any) {
        if let userName = Auth.auth().currentUser?.displayName{
        
        if commentInputBox.text != ""{
            let newComment = "\(userName) : \(commentInputBox.text!)"
            postData.comments.append(newComment)
            }
            
            let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
            let comments = ["comments": postData.comments]
            postRef.updateChildValues(comments)
            
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func handleCancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
}
}

