import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async -> [String: String] in
        ["message": "Welcome to HelloVapor API", "version": "1.0"]
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    try app.register(collection: TodoController())
}
