import 'package:bookly_flutter_app/Features/Home/Data/Models/book/book.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/Views/Widgets/books_details_section.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/Views/Widgets/custom_details_app_bar.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/Views/Widgets/details_similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const CustomDetailsAppBar(),
                BooksDetailsSection(book: book),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                const DetailsSimilarBooksSection(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
