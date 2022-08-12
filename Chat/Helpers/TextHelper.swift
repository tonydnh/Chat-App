//
//  TextHelper.swift
//  Chat
//
//  Created by Tony Dinh on 7/22/22.
//

import Foundation

class TextHelper {
    
    static func sanitizePhoneNumber(_ phone: String) -> String {
        return phone
            .replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
            .replacingOccurrences(of: "-", with: "")
            .replacingOccurrences(of: " ", with: "")
    }
    
    // https://stackoverflow.com/a/69799155/16614935
    static func limitText(_ stringvar: inout String, _ limit: Int) {
        if stringvar.count > limit {
            stringvar = String(stringvar.prefix(limit))
        }
    }
    
    // https://stackoverflow.com/a/51427133/16614935
    static func applyPatternOnNumbers(_ stringvar: inout String, pattern: String, replacementCharacter: Character) {
        var pureNumber = stringvar.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else {
                stringvar = pureNumber
                return
            }
            let stringIndex = String.Index(utf16Offset: index, in: pattern)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacementCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        stringvar = pureNumber
        
        // Limit characters to 17 to match +# (###) ###-####
        if stringvar.count > 17 {
            stringvar = String(stringvar.prefix(17))
        }
    }
    
}
