class ApiNetwork {
  // ~ bookshelf
  static final trendingBook = "https://openlibrary.org/trending/daily.json";

  static final literatureBook =
      "https://openlibrary.org/search.json?q=subject:literature";

  static final textBook =
      "https://openlibrary.org/search.json?q=subject:textbooks";

  static final motivation =
      "https://openlibrary.org/search.json?q=subject:motivation";

  static final thrillersBook =
      "https://openlibrary.org/search.json?q=subject:thrillers";

  static final romanceBook =
      "https://openlibrary.org/search.json?q=subject:romance";

  static final programmingBook =
      "https://openlibrary.org/search.json?q=subject:programming";

  static final quotes = "https://quotes-api-self.vercel.app/quote";

  // ~ search bookshelf

  static String searchBook(String value) {
    return "https://www.googleapis.com/books/v1/volumes?q=$value&startIndex=0&maxResults=20";
  }

  // ~ find book detail
  static String detailBook(String value) {
    return "https://openlibrary.org$value.json";
  }
}
