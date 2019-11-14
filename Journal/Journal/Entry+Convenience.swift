//
//  JournalEntry+Convenience.swift
//  Journal
//
//  Created by BDawg on 11/11/19.
//  Copyright © 2019 Brandi. All rights reserved.
//

import Foundation
import CoreData

enum JournalEntryMood: String, CaseIterable {
    case 🥺
    case 😶
    case 🙃
}

extension JournalEntry {
    @discardableResult convenience init(bodyText: String, title: String, timeStamp: Date = Date(), mood: JournalEntryMood = .😶, identifier: String = UUID().uuidString, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.bodyText = bodyText
        self.title = title
        self.timeStamp = timeStamp
        self.identifier = identifier
        self.mood = mood.rawValue
        
    }
}
