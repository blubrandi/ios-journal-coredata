//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by BDawg on 11/11/19.
//  Copyright © 2019 Brandi. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    var entry: JournalEntry? {
        didSet {
            updateViews()
        }
    }

    @IBOutlet weak var entryTitleTextField: UITextField!
    @IBOutlet weak var entryTextView: UITextView!
    @IBOutlet weak var moodSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func entrySaveButton(_ sender: UIBarButtonItem) {
        
        guard let title = entryTitleTextField.text,
            !title.isEmpty else { return }
        
        guard let bodyText = entryTextView.text,
            !bodyText.isEmpty else { return }
        
        let moodIndex = moodSegmentedControl.selectedSegmentIndex
        let mood = JournalEntryMood.allCases[moodIndex]
        
        if let entry = entry {
            entry.title = title
            entry.bodyText = bodyText
            entry.mood = mood.rawValue
            
        } else {
//            let _ = Entry(bodyText: bodyText, title: title)
            let _ = JournalEntry(bodyText: bodyText, title: title, mood: mood)
        }
        do {
            let moc = CoreDataStack.shared.mainContext
            try moc.save()
        } catch {
            print("Error saving managed object contest: \(error)")
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        guard isViewLoaded else { return }
        
        title = entry?.title ?? "Create JournalEntry"
        entryTitleTextField.text = entry?.title
        entryTextView.text = entry?.bodyText
        let mood: JournalEntryMood
        if let entryMood = entry?.mood {
            mood = JournalEntryMood(rawValue: entryMood)!
        } else {
            mood = .😶
        }
        
        moodSegmentedControl.selectedSegmentIndex = JournalEntryMood.allCases.firstIndex(of: mood)!
    }


}
