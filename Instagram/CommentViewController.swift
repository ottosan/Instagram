//
//  CommentViewController.swift
//  Instagram
//
//  Created by 音石朋恵 on 2017/02/09.
//  Copyright © 2017年 tomoe.otoishi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SVProgressHUD

class CommentViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    var postData: PostData!
    
    @IBAction func sendButton(_ sender: Any) {
        let commentTmp:String! = textView.text
        if commentTmp.isEmpty {
            // コメントが入力されていなかったときの処理
            SVProgressHUD.showError(withStatus: "コメントを入力して下さい")
            return
        }
        // Firebaseに保存するデータの準備
        if let name = FIRAuth.auth()?.currentUser?.displayName {
            let comment:String = commentTmp
            // 増えたcommentをFirebaseに保存する
            let postRef = FIRDatabase.database().reference().child(Const.PostPath).child(postData.id!)
            let caption = ["caption":postData.caption! + "\n\(name) : \(comment)"]
            postRef.updateChildValues(caption)
        }
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
