package com.example.sweater.domain;

import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;


@Entity // This tells Hibernate to make a table out of this class
public class Messages {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long id;

    @NotBlank(message = "Please fill some text")
    @Length(max = 2048, message = "To long")
    private String text;

    @NotBlank(message = "Please fill some text")
    @Length(max = 2048, message = "To long")
    private String tag;

    private int year;
    private String colour;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    private String filename;

    public Messages(Long id, String text, String tag, int year, String colour, User author, String filename) {
        this.id = id;
        this.text = text;
        this.tag = tag;
        this.year = year;
        this.colour = colour;
        this.author = author;
        this.filename = filename;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Messages() {
    }

    public Messages(String text, String tag, int year, String colour, User user) {
        this.text = text;
        this.tag = tag;
        this.year = year;
        this.colour = colour;
        this.author = user;
    }


    public User getAuthor() {return author;}

    public String getAuthorName(){
        return author != null ? author.getUsername() : "Польователь не указан";
    }

    public void setAuthor(User author) {this.author = author;}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getTag() {
        return tag;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getColour() {
        return colour;
    }

    public void setColour(String colour) {
        this.colour = colour;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }
}