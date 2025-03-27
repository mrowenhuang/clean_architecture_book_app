class ApiNetwork {
  // ~ bookshelf
  static final trendingBook = "https://openlibrary.org/trending/daily.json";

  static final literatureBook =
      "https://openlibrary.org/subjects/literature.json";

  static final textBook =
      "https://openlibrary.org/search.json?q=subject:textbooks";

  static final motivation =
      "https://openlibrary.org/search.json?q=subject:motivation";

  static final thrillersBook =
      "https://openlibrary.org/subjects/thrillers.json";

  static final romanceBook =
      "https://openlibrary.org/search.json?q=subject:romance";

  static final programmingBook =
      "https://openlibrary.org/subjects/programming.json";

  static final quotes = "https://quotes-api-self.vercel.app/quote";

  // ~ search bookshelf

  static String searchBook(String value) {
    return "https://www.googleapis.com/books/v1/volumes?q=$value&startIndex=0&maxResults=20";
  }
}
