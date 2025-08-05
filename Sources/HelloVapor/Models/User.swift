//
//  File.swift
//  HelloVapor
//
//  Created by Tsubasa Ishihara on 2025-08-03.
//

import Fluent
import struct Foundation.UUID
import struct Foundation.Date

final class User: Model, @unchecked Sendable {
    static let schema = "users"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "email")
    var email: String

    @Field(key: "name")
    var name: String
    
    @OptionalField(key: "profile_picture")
    var profilePicture: String?
    
    @OptionalField(key: "bio")
    var bio: String?
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    @Children(for: \.$author)
    var artworks: [Artwork]

    init() { }
    
    init(id: UUID? = nil, email: String, name: String) {
        self.id = id
        self.email = email
        self.name = name
    }
    
    func toDTO() -> UserDTO {
        .init(
            id: self.id,
            name: self.name
        )
    }
}
