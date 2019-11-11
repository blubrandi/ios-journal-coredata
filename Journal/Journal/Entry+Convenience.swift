//
//  Entry+Convenience.swift
//  Journal
//
//  Created by BDawg on 11/11/19.
//  Copyright © 2019 Brandi. All rights reserved.
//

import Foundation
import CoreData

extension Entry {
    convenience init(title: String, bodyText: String, timeStamp: Date, identifier: String, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.title = title
        self.bodyText = bodyText
        self.timeStamp = Date()
    }
}
