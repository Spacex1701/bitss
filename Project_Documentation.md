# Spring Boot Library Management System - Project Documentation

## Overview
This project implements a Spring Boot application for managing information about Authors and Books. The application supports CRUD operations (Create, Read, Update) for both entities, with a One-to-Many relationship between Authors and Books. The system uses JPA for database management, Spring MVC for web handling, JSP for views, and includes comprehensive unit testing.

## Entity Relationship Design

### Entities Chosen
- **Author**: Represents book authors with attributes like name and biography.
- **Book**: Represents books with attributes like title and publication year, linked to an author.

### Relationships
- **One-to-Many**: One Author can have many Books.
- **Many-to-One**: Each Book belongs to one Author.

### JPA Annotations Used
- `@Entity`: Marks classes as JPA entities.
- `@Id` and `@GeneratedValue`: Defines primary keys with auto-generation.
- `@Column`: Specifies column constraints (e.g., nullable, unique).
- `@OneToMany` and `@ManyToOne`: Defines relationships with cascade and fetch strategies.
- `@JoinColumn`: Specifies foreign key columns.

### Database Schema
- **authors** table: id (PK), name, bio
- **books** table: id (PK), title, publication_year, author_id (FK)

## Implementation Details

### Populate Database
The database is populated with sample data using a `CommandLineRunner` bean in `DataInitializer.java`. This inserts 10 authors and 10 books on application startup.

**Code Snippet:**
```java
@Component
@RequiredArgsConstructor
public class DataInitializer implements CommandLineRunner {
    // ... repositories injected
    
    @Override
    @Transactional
    public void run(String... args) throws Exception {
        if (authorRepository.count() == 0) {
            // Create and save 10 authors
            Author author1 = new Author("George Orwell", "English novelist and essayist");
            // ... more authors
            
            // Save authors
            authorRepository.save(author1);
            // ... 
            
            // Create and save 10 books linked to authors
            bookRepository.save(new Book("1984", 1949, author1));
            // ... more books
        }
    }
}
```

### Create Operation
Forms are implemented in JSP pages for adding new Authors and Books. Controller methods handle POST requests, validate data, and save entities. Exception handling is implemented for integrity violations.

**Controller Code (AuthorController.java):**
```java
@PostMapping
public String saveAuthor(@ModelAttribute("author") Author author) {
    authorService.save(author);
    return "redirect:/authors";
}
```

**JSP Form (authors/form.jsp):**
```jsp
<form:form action="${author.id == null ? '/authors' : '/authors/' += author.id}" method="post" modelAttribute="author">
    <label for="name">Name</label>
    <form:input path="name" id="name" required="true" />
    <label for="bio">Bio</label>
    <form:textarea path="bio" id="bio" />
    <button type="submit" class="btn">Save</button>
</form:form>
```

**Screenshot Description:** The add author form displays input fields for name and bio, with a save button. Upon submission, the user is redirected to the authors list.

### Read Operation
Lists are displayed in JSP pages showing all entities. A custom query performs an inner join to fetch books with their authors.

**Custom Query (BookRepository.java):**
```java
@Repository
public interface BookRepository extends JpaRepository<Book, Long> {
    @Query("SELECT b FROM Book b JOIN FETCH b.author")
    List<Book> findAllBooksWithAuthors();
}
```

**Controller Code (BookController.java):**
```java
@GetMapping
public String listBooks(Model model) {
    model.addAttribute("books", bookService.findAllWithAuthors());
    return "books/list";
}
```

**JSP List (books/list.jsp):**
```jsp
<table>
    <thead>
        <tr>
            <th>Title</th>
            <th>Publication Year</th>
            <th>Author</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="book" items="${books}">
            <tr>
                <td>${book.title}</td>
                <td>${book.publicationYear}</td>
                <td>${book.author.name}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
```

**Screenshot Description:** The books list page shows a table with columns for ID, Title, Publication Year, and Author Name, with an "Add New Book" button at the top.

### Update Operation
Edit functionality allows updating existing entities through pre-populated forms.

**Controller Code (BookController.java):**
```java
@PostMapping("/{id}")
public String updateBook(@PathVariable("id") Long id, @ModelAttribute("book") Book book) {
    Book existingBook = bookService.findById(id);
    existingBook.setTitle(book.getTitle());
    existingBook.setPublicationYear(book.getPublicationYear());
    existingBook.setAuthor(book.getAuthor());
    bookService.save(existingBook);
    return "redirect:/books";
}
```

**Screenshot Description:** The edit book form is similar to the add form but pre-filled with existing data, allowing users to modify and save changes.

## Testing
Unit tests are written using JUnit and Mockito for repository and service layers.

**Example Test (BookServiceTest.java):**
```java
@Test
void findAllWithAuthors_ShouldReturnListOfBooks() {
    when(bookRepository.findAllBooksWithAuthors()).thenReturn(Arrays.asList(testBook));
    List<Book> result = bookService.findAllWithAuthors();
    assertNotNull(result);
    assertEquals(1, result.size());
    verify(bookRepository, times(1)).findAllBooksWithAuthors();
}
```

Tests cover CRUD operations, exception handling, and custom queries. All tests pass successfully.

## Challenges Faced and Solutions
1. **JSP Configuration**: Initially struggled with JSP view resolution. Solved by adding `spring.mvc.view.prefix` and `spring.mvc.view.suffix` in `application.properties`.
2. **Entity Relationships**: Ensuring proper cascade and fetch strategies. Resolved by using `@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)` and `@ManyToOne(fetch = FetchType.LAZY)`.
3. **Exception Handling**: Implementing global exception handling for data integrity violations. Used `@ControllerAdvice` with `@ExceptionHandler`.
4. **Testing**: Mocking dependencies in service tests. Learned to use `@ExtendWith(MockitoExtension.class)` and proper mocking techniques.

## GitHub URL
The complete project code is available at: https://github.com/Spacex1701/bitss

## Conclusion
This project demonstrates a complete Spring Boot application with proper architecture, CRUD operations, and testing. The application is functional, user-friendly, and follows best practices for Spring Boot development.