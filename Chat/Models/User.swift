//
//  User.swift
//  Chat
//
//  Created by Tony Dinh on 7/22/22.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable {
    
    @DocumentID var id : String?
    var firstName: String?
    var lastName: String?
    var phoneNumber: String?
    var photo: String?
    
    
}
