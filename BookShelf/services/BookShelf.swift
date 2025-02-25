import Foundation

class BookShelf: BookShelfProtocol {
    private var books: [UUID: BookProtocol] = [:]
    
    func addBook(book: BookProtocol) {
        books[book.id] = book
        print("Book \(book.title) - \(book.author) has been added.")
    }
    
    func deleteBook(by id: UUID) throws {
        guard books.removeValue(forKey: id) != nil else {
            throw BookError.bookNotFound
        }
        
        print("Book \(id) has been deleted.")
    }
    
    func getAllBooks() -> [BookProtocol] {
        return Array(books.values)
    }
    
    func findBookByCriteria(criteria: Criteria) -> [BookProtocol] {
        return books.values.filter { $0.matches(criteria: criteria) }
    }
}
