//
//  Book.swift
//  mini-project-assignment
//
//  Created by Ioana Foghel on 4/29/16.
//  Copyright © 2016 Ioana Foghel. All rights reserved.
//

import UIKit

class Book: NSObject {
    var title: String
    var author: String
    var pubDate: String
    var summary: String
    
    init(title: String, author: String, pubDate: String, summary: String) {
        self.title = title
        self.author = author
        self.pubDate = pubDate
        self.summary = summary
    }
}

