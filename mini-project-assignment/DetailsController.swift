//
//  DetailsController.swift
//  mini-project-assignment
//
//  Created by Ioana Foghel on 4/29/16.
//  Copyright © 2016 Ioana Foghel. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {
    
    var book: Book?
    var titleProperty: String?
    var authorProperty: String?
    var pubDateProperty: String?
    var summaryProperty: String?
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var authorLabel: UILabel!
    
    
    @IBOutlet weak var pubDateLabel: UILabel!
   
    @IBOutlet weak var summaryTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        if let title = titleProperty{
            titleLabel.text = "Title: " + title
        }
        if let author = authorProperty{
            authorLabel.text = "Author: " + author
        }
       if let pubDate = pubDateProperty{
            pubDateLabel.text = "Publication date: " + pubDate
       }
       if let summary = summaryProperty{
            summaryTextView.text = "Summary: \n" + summary
        
        }
    }
    
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
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
