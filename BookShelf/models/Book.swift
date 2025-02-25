import Foundation

struct Book: BookProtocol {
    let id: UUID
    let title: String
    let author: String
    let publicationYear: Int?
    let genre: Genre
    
    func matches(criteria: Criteria) -> Bool {
        switch criteria {
        case .title(let title):
            return self.title.lowercased().contains(title.lowercased())
        case .author(let author):
            return self.author.lowercased().contains(author.lowercased())
        case .publicationYear(let year):
            return self.publicationYear == year
        case .genre(let genre):
            return self.genre == genre
        default:
            return false
        }
    }
    
    func printBook() {
        print("Book:", id, title, author, publicationYear, genre.rawValue)
    }
}
