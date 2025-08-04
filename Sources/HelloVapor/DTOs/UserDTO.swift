//
//  File.swift
//  HelloVapor
//
//  Created by Tsubasa Ishihara on 2025-08-03.
//

import Fluent
import Vapor

struct UserDTO: Content {
    var id: UUID?
    var name: String?
    
    func toModel() -> User {
        let model = User()
        
        model.id = self.id
        if let name = self.name {
            model.name = name
        }
        return model
    }
}
