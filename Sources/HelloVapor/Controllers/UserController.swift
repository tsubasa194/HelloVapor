//
//  File.swift
//  HelloVapor
//
//  Created by Tsubasa Ishihara on 2025-08-03.
//

import Fluent
import Vapor

struct UserController: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        let users = routes.grouped("users")
        
        users.get(use: self.index)  // Handle GET /users/
        users.get(":userID", use: self.show)
        users.post(use: self.create)
    }
    
    @Sendable func index(req: Request) async throws -> [UserDTO] {
        try await User.query(on: req.db).all().map { $0.toDTO() }
    }
    
    @Sendable func show(req: Request) async throws -> UserDTO {
        // Extract and validate UUID parameter
        guard let userIDString = req.parameters.get("userID"),
              let userID = UUID(uuidString: userIDString) else {
            throw Abort(.badRequest, reason: "Invalid UUID format for userID")
        }
        
        // Query user by UUID
        guard let user = try await User.find(userID, on: req.db) else {
            throw Abort(.notFound, reason: "User not found")
        }
        
        // Return user data as JSON
        return user.toDTO()
    }
    
    @Sendable func create(req: Request) async throws -> UserDTO {
        let userDTO = try req.content.decode(UserDTO.self)
        let user = userDTO.toModel()
        
        try await user.save(on: req.db)
        return user.toDTO()
    }
}
