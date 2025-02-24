import Foundation

enum Criteria {
    case title(String)
    case author(String)
    case genre(Genre)
    case publicationYear(Int?)
}
