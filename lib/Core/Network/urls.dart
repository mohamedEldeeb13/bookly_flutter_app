class URLs {
  // Singleton instance
  static final URLs _instance = URLs._internal();

  // Factory constructor
  factory URLs() {
    return _instance;
  }

  // Private constructor
  URLs._internal();

  // Base URLs
  final String baseURL = "https://www.googleapis.com/books/v1/";

  String getNewestBooksURL() {
    return "${baseURL}volumes?q=computer science&Filtering=free-ebooks&Sorting=newest";
  }

  String getSimilarBooksURL({required String category}) {
    return "${baseURL}volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming";
  }

  String getFeaturedBooksURL() {
    return "${baseURL}volumes?q=subject:programming&Filtering=free-ebooks";
  }
}
