//
//  File.swift
//  HelloVapor
//
//  Created by Tsubasa Ishihara on 2025-08-05.
//

import Fluent
import struct Foundation.UUID
import struct Foundation.Date

final class Artwork: Model, @unchecked Sendable {
    static let schema = "artworks"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "author_id")
    var author: User
    
    @Field(key: "image_url")
    var imageURL: String
    
    @OptionalField(key: "thumbnail_url")
    var thumbnailURL: String?
    
    @Field(key: "title")
    var title: String
    
    @OptionalField(key: "description")
    var description: String?
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    @Field(key: "is_published")
    var isPublished: Bool
    
    init() { }
    
    init(id: UUID? = nil, authorID: UUID, imageURL: String, thumbnailURL: String? = nil, title: String, description: String? = nil, isPublished: Bool = false) {
        self.id = id
        self.$author.id = authorID
        self.imageURL = imageURL
        self.thumbnailURL = thumbnailURL
        self.title = title
        self.description = description
        self.isPublished = isPublished
    }
}
