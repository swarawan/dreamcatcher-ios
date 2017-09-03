//
//  Article.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 8/31/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

struct Article {
    var id: Int
    var title: String
    var writer: String
    var category: String
    var image: String
}

class ArticleSample {
    static let generateSample = [
        Article(id: 1, title: "The Secret to a Positive Attitude Is Simpler Than You Think", writer: "Thomas Oppong", category: "Inspiration", image: "1"),
        Article(id: 2, title: "How To Dramatically Sharpen Your Attention And Focus", writer: "Mike Sturm", category: "Self Improvement", image: "2"),
        Article(id: 3, title: "If It Doesn’t Suck, It’s Not Worth Doing", writer: "Benjamin P. Hardy", category: "Life Lesson", image: "3"),
        Article(id: 4, title: "I’m 35 and I may suddenly have lost the rest of my life. I’m panicking, just a bit.", writer: "Scott Riddle", category: "Life Lesson", image: "4"),
        Article(id: 5, title: "Grey Coffee", writer: "Elliot Nichols", category: "Coffee", image: "5"),
        Article(id: 6, title: "The real difference between a relationship and a not-relationship.", writer: "Cassidy Spencer", category: "Love", image: "6"),
        Article(id: 7, title: "Instead of Killing Myself, I Called a Suicide Hotline", writer: "Joel Leon", category: "Love", image: "7"),
        Article(id: 8, title: "The `Do Something” Principle`", writer: "Mark Manson", category: "Inspiration", image: "8"),
        Article(id: 9, title: "Stop Consuming. Start Creating.", writer: "The Mission", category: "Inspration", image: "9"),
        Article(id: 10, title: "How to let go of them... Whoever they are", writer: "R. H. Sin", category: "Love", image: "10"),
        Article(id: 11, title: "If You Can’t Be the Best, Change the Category", writer: "Jeff Goins", category: "Coffee", image: "11"),
        Article(id: 12, title: "Are you a good person, or just insecure?", writer: "Lidija Hilje", category: "Self Improvement", image: "12")
    ]
}
