import Fluent
import Foundation

struct SeedUsers: AsyncMigration {
    func prepare(on database: any Database) async throws {
        // Create test users
        let users = [
            User(email: "alice@example.com", name: "Alice Cooper"),
            User(email: "charlie@example.com", name: "Charlie Brown"),
            User(email: "diana@example.com", name: "Diana Prince"),
            User(email: "eddie@example.com", name: "Eddie Murphy"),
            User(email: "fiona@example.com", name: "Fiona Green")
        ]
        
        // Save all users to database
        try await users.create(on: database)
    }
    
    func revert(on database: any Database) async throws {
        // Remove all seeded users
        try await User.query(on: database)
            .filter(\.$name ~~ ["Alice Cooper", "Charlie Brown", "Diana Prince", "Eddie Murphy", "Fiona Green"])
            .delete()
    }
}
