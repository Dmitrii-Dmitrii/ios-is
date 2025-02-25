import Foundation

struct Comic: BookProtocol {
    let id: UUID
    let title: String
    let author: String
    let publicationYear: Int?
    let number: Int
    
    func matches(criteria: Criteria) -> Bool {
        switch criteria {
        case .title(let title):
            return self.title.lowercased().contains(title.lowercased())
        case .author(let author):
            return self.author.lowercased().contains(author.lowercased())
        case .publicationYear(let year):
            return self.publicationYear == year
        case .comicNumber(let number):
            return self.number == number
        default:
            return false
        }
    }
    
    func printBook() {
        print("Comic:", id, title, author, publicationYear, number)
    }
}
