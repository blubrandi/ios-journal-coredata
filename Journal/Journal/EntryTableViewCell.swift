//
//  EntryTableViewCell.swift
//  Journal
//
//  Created by BDawg on 11/11/19.
//  Copyright © 2019 Brandi. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {

    @IBOutlet weak var entryTitleLabel: UILabel!
    @IBOutlet weak var bodyTextLabel: UILabel!
    @IBOutlet weak var dateStampLabel: UILabel!
    
    var entry: JournalEntry? {
        didSet {
            updateViews()
        }
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLL dd yyyy"
        return formatter
    }
    
    func updateViews() {
        print(entry?.title)
        guard let entry = entry,
            let timeStamp = entry.timeStamp
        else { return }
        
        entryTitleLabel.text = entry.title
        bodyTextLabel.text = entry.bodyText
        dateStampLabel.text = dateFormatter.string(from: timeStamp)
    }

}
