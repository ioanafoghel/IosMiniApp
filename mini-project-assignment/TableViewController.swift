//
//  TableViewController.swift
//  mini-project-assignment
//
//  Created by Ioana Foghel on 4/29/16.
//  Copyright © 2016 Ioana Foghel. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var books = [Book]()
    
    @IBOutlet weak var bookDataView: UITableView!
   
    
    @IBAction func back(segue: UIStoryboardSegue){
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        
        let book = books[indexPath.row]
        cell.title.text = book.title
        cell.title.textColor = UIColor.blueColor()
        cell.author.text = book.author
        cell.author.textColor = UIColor.blackColor()
        cell.pubDate.text = book.pubDate
        cell.pubDate.hidden = true
        cell.summary.text = book.summary
        cell.summary.hidden = true
        
        return cell
    }
    
    func dataIsReady(){
        dispatch_async(dispatch_get_main_queue()) {
            self.tableView.reloadData()
        }
    }

        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        if segue.identifier == "showDetails" {
            let detailViewController = (segue.destinationViewController as! UINavigationController).viewControllers.first as! DetailsController

            
            
            if let selectedCell = sender as? TableViewCell
                
            {
                let  indexPath = bookDataView.indexPathForCell(selectedCell)!
                let selectedItem = books[indexPath.row]
                detailViewController.book = selectedItem
                detailViewController.titleProperty = selectedItem.title
                detailViewController.authorProperty = selectedItem.author
                detailViewController.pubDateProperty = selectedItem.pubDate
                detailViewController.summaryProperty = selectedItem.summary
            }
        }
    }
}
