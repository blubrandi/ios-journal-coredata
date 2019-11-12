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
        
        if let entry = entry {
            entry.title = title
            entry.bodyText = bodyText
        } else {
//            let _ = Entry(bodyText: bodyText, title: title)
            JournalEntry(bodyText: bodyText, title: title)
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
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
