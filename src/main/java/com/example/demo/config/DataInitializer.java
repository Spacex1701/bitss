package com.example.demo.config;

import com.example.demo.entity.Author;
import com.example.demo.entity.Book;
import com.example.demo.repository.AuthorRepository;
import com.example.demo.repository.BookRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@RequiredArgsConstructor
public class DataInitializer implements CommandLineRunner {

    private final AuthorRepository authorRepository;
    private final BookRepository bookRepository;

    @Override
    @Transactional
    public void run(String... args) throws Exception {
        if (authorRepository.count() == 0) {
            Author author1 = new Author("George Orwell", "English novelist and essayist");
            Author author2 = new Author("J.K. Rowling", "British author and philanthropist");
            Author author3 = new Author("J.R.R. Tolkien", "English writer, poet, and philologist");
            Author author4 = new Author("Isaac Asimov", "American writer and professor of biochemistry");
            Author author5 = new Author("Arthur C. Clarke", "British science fiction writer");
            Author author6 = new Author("Agatha Christie", "English writer known for her detective novels");
            Author author7 = new Author("Stephen King", "American author of horror and supernatural fiction");
            Author author8 = new Author("Ernest Hemingway", "American novelist and short-story writer");
            Author author9 = new Author("Mark Twain", "American writer, humorist, and entrepreneur");
            Author author10 = new Author("Jane Austen", "English novelist known primarily for her six major novels");

            authorRepository.save(author1);
            authorRepository.save(author2);
            authorRepository.save(author3);
            authorRepository.save(author4);
            authorRepository.save(author5);
            authorRepository.save(author6);
            authorRepository.save(author7);
            authorRepository.save(author8);
            authorRepository.save(author9);
            authorRepository.save(author10);

            bookRepository.save(new Book("1984", 1949, author1));
            bookRepository.save(new Book("Harry Potter and the Sorcerer's Stone", 1997, author2));
            bookRepository.save(new Book("The Hobbit", 1937, author3));
            bookRepository.save(new Book("Foundation", 1951, author4));
            bookRepository.save(new Book("2001: A Space Odyssey", 1968, author5));
            bookRepository.save(new Book("And Then There Were None", 1939, author6));
            bookRepository.save(new Book("The Shining", 1977, author7));
            bookRepository.save(new Book("The Old Man and the Sea", 1952, author8));
            bookRepository.save(new Book("The Adventures of Tom Sawyer", 1876, author9));
            bookRepository.save(new Book("Pride and Prejudice", 1813, author10));
        }
    }
}
