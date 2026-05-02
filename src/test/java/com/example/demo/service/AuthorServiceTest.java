package com.example.demo.service;

import com.example.demo.entity.Author;
import com.example.demo.repository.AuthorRepository;
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
class AuthorServiceTest {

    @Mock
    private AuthorRepository authorRepository;

    @InjectMocks
    private AuthorService authorService;

    private Author testAuthor;

    @BeforeEach
    void setUp() {
        testAuthor = new Author(1L, "Test Author", "Bio", null);
    }

    @Test
    void findAll_ShouldReturnListOfAuthors() {
        when(authorRepository.findAll()).thenReturn(Arrays.asList(testAuthor));

        List<Author> result = authorService.findAll();

        assertNotNull(result);
        assertEquals(1, result.size());
        assertEquals("Test Author", result.get(0).getName());
        verify(authorRepository, times(1)).findAll();
    }

    @Test
    void findById_WhenAuthorExists_ShouldReturnAuthor() {
        when(authorRepository.findById(1L)).thenReturn(Optional.of(testAuthor));

        Author result = authorService.findById(1L);

        assertNotNull(result);
        assertEquals(1L, result.getId());
        verify(authorRepository, times(1)).findById(1L);
    }

    @Test
    void findById_WhenAuthorDoesNotExist_ShouldThrowException() {
        when(authorRepository.findById(1L)).thenReturn(Optional.empty());

        assertThrows(IllegalArgumentException.class, () -> authorService.findById(1L));
        verify(authorRepository, times(1)).findById(1L);
    }

    @Test
    void save_ShouldReturnSavedAuthor() {
        when(authorRepository.save(any(Author.class))).thenReturn(testAuthor);

        Author result = authorService.save(testAuthor);

        assertNotNull(result);
        assertEquals("Test Author", result.getName());
        verify(authorRepository, times(1)).save(testAuthor);
    }
}