package com.example.demo.controller;

import com.example.demo.entity.Author;
import com.example.demo.service.AuthorService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/authors")
@RequiredArgsConstructor
public class AuthorController {

    private final AuthorService authorService;

    @GetMapping
    public String listAuthors(Model model) {
        model.addAttribute("authors", authorService.findAll());
        return "authors/list";
    }

    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("author", new Author());
        return "authors/form";
    }

    @PostMapping
    public String saveAuthor(@ModelAttribute("author") Author author) {
        authorService.save(author);
        return "redirect:/authors";
    }

    @GetMapping("/{id}/edit")
    public String showUpdateForm(@PathVariable("id") Long id, Model model) {
        Author author = authorService.findById(id);
        model.addAttribute("author", author);
        return "authors/form";
    }

    @PostMapping("/{id}")
    public String updateAuthor(@PathVariable("id") Long id, @ModelAttribute("author") Author author) {
        Author existingAuthor = authorService.findById(id);
        existingAuthor.setName(author.getName());
        existingAuthor.setBio(author.getBio());
        authorService.save(existingAuthor);
        return "redirect:/authors";
    }
}