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
            print("Input book type (1 - book, 2 - comic, 3 - textbook):")
            guard let bookType = readLine(), let bookTypeInt = Int(bookType) else {
                print("Inccorect input!")
                continue
            }
            
            print("Input title:")
            let title = readLine() ?? "Unknown"
            
            print("Input author:")
            let author = readLine() ?? "Unknown"
            
            print("Input publication year:")
            let publicationYear = Int(readLine() ?? "")
            
            var newBook: BookProtocol?
            switch bookTypeInt {
            case 1:
                print("Input genre:")
                let genre = Genre(rawValue: readLine() ?? "Unknown") ?? .unknown
                newBook = Book(id: UUID(), title: title, author: author, publicationYear: publicationYear, genre: genre)
            
            case 2:
                print("Input comic number:")
                if let number = Int(readLine() ?? "") {
                    newBook = Comic(id: UUID(), title: title, author: author, publicationYear: publicationYear, number: number)
                } else {
                    print("Incorrect comic number!")
                }
                
                
            case 3:
                print("Input course number:")
                if let number = Int(readLine() ?? "") {
                    newBook = Textbook(id: UUID(), title: title, author: author, publicationYear: publicationYear, courseNumber: number)
                } else {
                    print("Incorrect course number!")
                }
                
            default:
                print("Inccorect input!")
            }
            
            if let book = newBook {
                bookShelf.addBook(book: book)
                print("Book added successfully!")
            } else {
                print("Failed to add book!")
            }

        
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
                book.printBook()
            }
            
        case 4:
            print("Input criteria (1 - title, 2 - author, 3 - genre, 4 - publication year, 5 - comic number, 6 - course number):")
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
                    book.printBook()
                }
                
            case 2:
                print("Input author:")
                let author = readLine() ?? "Unknown"
                let books = bookShelf.findBookByCriteria(criteria: Criteria.author(author))
                books.forEach { book in
                    book.printBook()
                }
                
            case 3:
                print("Input genre:")
                let genre = Genre(rawValue: readLine()?.lowercased() ?? "Unknown") ?? .unknown
                let books = bookShelf.findBookByCriteria(criteria: Criteria.genre(genre))
                books.forEach { book in
                    book.printBook()
                }
                
            case 4:
                print("Input publication year:")
                let publicationYear = Int(readLine() ?? "")
                let books = bookShelf.findBookByCriteria(criteria: Criteria.publicationYear(publicationYear))
                books.forEach { book in
                    book.printBook()
                }
                
            case 5:
                print("Input comic number:")
                if let number = Int(readLine() ?? "") {
                    let books = bookShelf.findBookByCriteria(criteria: Criteria.comicNumber(number))
                    books.forEach { book in
                        book.printBook()
                    }
                } else {
                    print("Incorrect comic number!")
                }
               
            case 6:
                print("Input course number:")
                if let number = Int(readLine() ?? "") {
                    let books = bookShelf.findBookByCriteria(criteria: Criteria.courseNumber(number))
                    books.forEach { book in
                        book.printBook()
                    }
                } else {
                    print("Incorrect course number!")
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
