//
//  ApiKey.swift
//  Hyber
//
//  Created by Taras on 2/16/17.
//  Copyright © 2017 Incuube. All rights reserved.
//

import UIKit

let clientApiKey = "\(gedApiKeyTest)"

class func gedApiKeyTest() -> String {
    let def = UserDefaults.standard
    if def.object(forKey: "apikey") == nil {
        return "demo"
    } else {
        return def.string(forKey: "apikey")
    }
}
