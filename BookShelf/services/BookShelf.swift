import Foundation

class BookShelf: IBookShelf {
    private var books: [UUID: Book] = [:]
    
    func addBook(book: Book) {
        books[book.id] = book
        print("Book \(book.title) - \(book.author) has been added.")
    }
    
    func deleteBook(by id: UUID) throws {
        guard books.removeValue(forKey: id) != nil else {
            throw BookError.bookNotFound
        }
        
        print("Book \(id) has been deleted.")
    }
    
    func getAllBooks() -> [Book] {
        return Array(books.values)
    }
    
    func findBookByCriteria(criteria: Criteria) -> [Book] {
        return books.values.filter { book in
            switch criteria {
            case .title(let title):
                return book.title.lowercased().contains(title.lowercased())
                
            case .author(let author):
                return book.author.lowercased().contains(author.lowercased())
                
            case .genre(let genre):
                return book.genre == genre
                
            case .publicationYear(let year):
                return book.publicationYear == year
            }
        }
    }
}
