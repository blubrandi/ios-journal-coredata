//
//  EntryRepresentation.swift
//  Journal
//
//  Created by BDawg on 11/14/19.
//  Copyright © 2019 Brandi. All rights reserved.
//

import Foundation

struct JournalEntryRepresentation: Codable {
    var title: String
    var mood: String
    var bodyText: String
    var timeStamp: Date
    var identifier: String
}
