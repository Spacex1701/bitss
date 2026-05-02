# Full-Stack Spring Boot Assignment Report

## 1. Entity Relationship Design

For this assignment, the two chosen entities are **Author** and **Book**. 
They are designed with a **One-to-Many** relationship, where one Author can have multiple Books, and each Book is associated with a single Author.

- **Author**: Contains fields `id`, `name`, and `bio`. It is mapped with `@Entity` and has a `@OneToMany` relationship mapped by the `author` field in the Book entity.
- **Book**: Contains fields `id`, `title`, and `publicationYear`. It is mapped with `@Entity` and has a `@ManyToOne` relationship to `Author`, using `@JoinColumn(name = "author_id")`. A unique constraint is added on the `title` field to demonstrate integrity violation handling.

## 2. Implementation Details

### Database Population
The `DataInitializer` component implements `CommandLineRunner`. Upon application startup, it injects both `AuthorRepository` and `BookRepository` to insert 10 sample authors and 10 sample books into the H2 database if the database is empty.

### Create Operation
- **Form View**: Developed in `src/main/webapp/WEB-INF/jsp/books/form.jsp`. Uses Spring's `<form:form>` tags for data binding.
- **Controller Method**: `BookController.saveBook(@ModelAttribute Book book)` handles POST requests to `/books`.
- **Exception Handling**: If a user attempts to add a book with a duplicate title (violating the unique constraint), a `DataIntegrityViolationException` is thrown. The `@ControllerAdvice` class `GlobalExceptionHandler` catches this and displays a styled `error.jsp` page to the user.

### Read Operation
- **List View**: Developed in `src/main/webapp/WEB-INF/jsp/books/list.jsp`. Uses JSTL `<c:forEach>` to iterate over books and display details in an HTML table.
- **Controller Method**: `BookController.listBooks(Model model)` fetches books and binds them to the view.
- **Custom Repository Query**: `BookRepository` contains `@Query("SELECT b FROM Book b JOIN FETCH b.author")`, which executes an **inner join** fetching both Book and Author data efficiently in a single query.

### Update Operation
- **Form View**: Reuses `form.jsp`. The form action dynamically changes to POST to `/books/{id}`.
- **Controller Method**: `BookController.updateBook()` receives the updated details, fetches the existing entity from the database, updates its properties, and persists the changes.

## 3. Testing
- **Unit Tests**: `BookServiceTest` extensively uses Mockito (`@Mock`, `@InjectMocks`) to test the service logic independently of the database.
- **Integration Tests**: `BookRepositoryTest` uses `@DataJpaTest` to verify that the custom inner join query executes correctly against the database.

## 4. Challenges Faced & Solutions

**Challenge**: Rendering JSP pages smoothly with modern Spring Boot. Spring Boot prefers Thymeleaf, and JSP support has been phased out of default starters, especially with the migration to Jakarta EE.
**Solution**: I added `tomcat-embed-jasper` and the new `jakarta.servlet.jsp.jstl` dependencies manually to the `build.gradle`, and explicitly mapped the view resolver prefix and suffix in `application.properties`.

**Challenge**: N+1 Query Problem when fetching books and their authors.
**Solution**: Instead of relying on the default `findAll()` method which would trigger additional queries for each author, I wrote a custom inner join fetch query: `SELECT b FROM Book b JOIN FETCH b.author`.

## 5. GitHub URL
**Project URL**: https://github.com/Spacex1701/bits
