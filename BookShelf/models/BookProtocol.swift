import Foundation

protocol BookProtocol {
    var id: UUID { get }
    var title: String { get }
    var author: String { get }
    var publicationYear: Int? { get }
    
    func matches(criteria: Criteria) -> Bool
    func printBook()
}
