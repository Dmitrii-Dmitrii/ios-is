import Foundation

protocol IBookShelf {
    func addBook(book: Book)
    func deleteBook(by id: UUID) throws
    func getAllBooks() -> [Book]
    func findBookByCriteria(criteria: Criteria) -> [Book]
}
