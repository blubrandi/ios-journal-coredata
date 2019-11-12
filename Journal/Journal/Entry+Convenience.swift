//
//  JournalEntry+Convenience.swift
//  Journal
//
//  Created by BDawg on 11/11/19.
//  Copyright © 2019 Brandi. All rights reserved.
//

import Foundation
import CoreData

extension JournalEntry {
    @discardableResult convenience init(bodyText: String, title: String, timeStamp: Date = Date(), identifier: String = UUID().uuidString, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.bodyText = bodyText
        self.title = title
        self.timeStamp = timeStamp
        self.identifier = identifier
        
    }
}
