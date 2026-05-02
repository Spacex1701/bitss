package com.example.demo.repository;

import com.example.demo.entity.Author;
import com.example.demo.entity.Book;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class BookRepositoryTest {

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private AuthorRepository authorRepository;

    @Test
    void findAllBooksWithAuthors_ShouldReturnBooksWithAuthorDataFetched() {
        Author author = new Author("Test Author", "Bio");
        authorRepository.save(author);

        Book book1 = new Book("Test Book 1", 2021, author);
        Book book2 = new Book("Test Book 2", 2022, author);
        bookRepository.save(book1);
        bookRepository.save(book2);

        List<Book> books = bookRepository.findAllBooksWithAuthors();

        assertNotNull(books);
        assertTrue(books.size() >= 2);
        
        // Find our specific test book to verify
        Book fetchedBook = books.stream()
                .filter(b -> b.getTitle().equals("Test Book 1"))
                .findFirst()
                .orElse(null);
                
        assertNotNull(fetchedBook);
        assertNotNull(fetchedBook.getAuthor());
        assertEquals("Test Author", fetchedBook.getAuthor().getName());
    }
}
