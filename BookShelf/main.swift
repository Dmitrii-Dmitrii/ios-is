import Foundation

func main() {
    let bookShelf = BookShelf()
    
    while true {
        print("Choose option:")
        print("1. Add book")
        print("2. Delete book")
        print("3. Get all books")
        print("4. Find book by criteria")
        print("5. Exit")
        
        guard let input = readLine(), let option = Int(input) else {
            print("Inccorect input!")
            continue
        }
        
        switch option {
        case 1:
            print("Input title:")
            let title = readLine() ?? "Unknown"
            
            print("Input author:")
            let author = readLine() ?? "Unknown"
            
            print("Input publication year:")
            let publicationYear = Int(readLine() ?? "")
            
            print("Input genre:")
            let genre = Genre(rawValue: readLine() ?? "Unknown") ?? .unknown
            
            bookShelf.addBook(book: Book(id: UUID(), title: title, author: author, publicationYear: publicationYear, genre: genre))
        
        case 2:
            print("Input ID:")
            let idString = readLine() ?? ""
            guard let id = UUID(uuidString: idString) else {
                print("Inccorect ID!")
                continue
            }
            do {
                try bookShelf.deleteBook(by: id)
            } catch {
                print("Book hasn't been found!")
            }
        
        case 3:
            let books = bookShelf.getAllBooks()
            books.forEach { book in
                print(book.id, book.title, book.author, book.publicationYear, book.genre.rawValue)
            }
            
        case 4:
            print("Input criteria (1 - title, 2 - author, 3 - genre, 4 - publication year):")
            guard let criteria = readLine(), let option = Int(criteria) else {
                print("Inccorect input!")
                continue
            }
            
            switch option {
            case 1:
                print("Input title:")
                let title = readLine() ?? "Unknown"
                let books = bookShelf.findBookByCriteria(criteria: Criteria.title(title))
                books.forEach { book in
                    print(book.id, book.title, book.author, book.publicationYear, book.genre.rawValue)
                }
                
            case 2:
                print("Input author:")
                let author = readLine() ?? "Unknown"
                let books = bookShelf.findBookByCriteria(criteria: Criteria.author(author))
                books.forEach { book in
                    print(book.id, book.title, book.author, book.publicationYear, book.genre.rawValue)
                }
                
            case 3:
                print("Input genre:")
                let genre = Genre(rawValue: readLine()?.lowercased() ?? "Unknown") ?? .unknown
                let books = bookShelf.findBookByCriteria(criteria: Criteria.genre(genre))
                books.forEach { book in
                    print(book.id, book.title, book.author, book.publicationYear, book.genre.rawValue)
                }
                
            case 4:
                print("Input publication year:")
                let publicationYear = Int(readLine() ?? "")
                let books = bookShelf.findBookByCriteria(criteria: Criteria.publicationYear(publicationYear))
                books.forEach { book in
                    print(book.id, book.title, book.author, book.publicationYear, book.genre.rawValue)
                }
            default:
                print("Inccorect input!")
            }
            
        case 5:
            return
        default:
            print("Inccorect input!")
        }
    }
}

main()
