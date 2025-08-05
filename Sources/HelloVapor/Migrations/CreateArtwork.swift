//
//  File.swift
//  HelloVapor
//
//  Created by Tsubasa Ishihara on 2025-08-06.
//

import Fluent

struct CreateArtwork: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema("artworks")
            .id()
            .field("author_id", .uuid, .required, .references("users", "id"))
            .field("image_url", .string, .required)
            .field("thumbnail_url", .string)
            .field("title", .string, .required)
            .field("description", .string)
            .field("created_at", .datetime, .required)
            .field("updated_at", .datetime, .required)
            .field("is_published", .bool, .required)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema("artworks").delete()
    }
}
