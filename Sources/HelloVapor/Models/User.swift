//
//  File.swift
//  HelloVapor
//
//  Created by Tsubasa Ishihara on 2025-08-03.
//

import Fluent
import struct Foundation.UUID

final class User: Model, @unchecked Sendable {
    static let schema = "users"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String
    
    init() { }
    
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
    
    func toDTO() -> UserDTO {
        .init(
            id: self.id,
            name: self.name
        )
    }
}
