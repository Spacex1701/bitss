package com.example.demo.service;

import com.example.demo.entity.Author;
import com.example.demo.entity.Book;
import com.example.demo.repository.BookRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class BookServiceTest {

    @Mock
    private BookRepository bookRepository;

    @InjectMocks
    private BookService bookService;

    private Book testBook;
    private Author testAuthor;

    @BeforeEach
    void setUp() {
        testAuthor = new Author(1L, "Test Author", "Bio", null);
        testBook = new Book(1L, "Test Book", 2023, testAuthor);
    }

    @Test
    void findAllWithAuthors_ShouldReturnListOfBooks() {
        when(bookRepository.findAllBooksWithAuthors()).thenReturn(Arrays.asList(testBook));

        List<Book> result = bookService.findAllWithAuthors();

        assertNotNull(result);
        assertEquals(1, result.size());
        assertEquals("Test Book", result.get(0).getTitle());
        verify(bookRepository, times(1)).findAllBooksWithAuthors();
    }

    @Test
    void findById_WhenBookExists_ShouldReturnBook() {
        when(bookRepository.findById(1L)).thenReturn(Optional.of(testBook));

        Book result = bookService.findById(1L);

        assertNotNull(result);
        assertEquals(1L, result.getId());
        verify(bookRepository, times(1)).findById(1L);
    }

    @Test
    void findById_WhenBookDoesNotExist_ShouldThrowException() {
        when(bookRepository.findById(1L)).thenReturn(Optional.empty());

        assertThrows(IllegalArgumentException.class, () -> bookService.findById(1L));
        verify(bookRepository, times(1)).findById(1L);
    }

    @Test
    void save_ShouldReturnSavedBook() {
        when(bookRepository.save(any(Book.class))).thenReturn(testBook);

        Book result = bookService.save(testBook);

        assertNotNull(result);
        assertEquals("Test Book", result.getTitle());
        verify(bookRepository, times(1)).save(testBook);
    }
}
