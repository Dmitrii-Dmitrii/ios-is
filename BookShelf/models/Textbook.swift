import Foundation

struct Textbook: BookProtocol {
    let id: UUID
    let title: String
    let author: String
    let publicationYear: Int?
    let courseNumber: Int
    
    func matches(criteria: Criteria) -> Bool {
        switch criteria {
        case .title(let title):
            return self.title.lowercased().contains(title.lowercased())
        case .author(let author):
            return self.author.lowercased().contains(author.lowercased())
        case .publicationYear(let year):
            return self.publicationYear == year
        case .courseNumber(let number):
            return self.courseNumber == number
        default:
            return false
        }
    }
    
    func printBook() {
        print("Textbook:", id, title, author, publicationYear, courseNumber)
    }
}
