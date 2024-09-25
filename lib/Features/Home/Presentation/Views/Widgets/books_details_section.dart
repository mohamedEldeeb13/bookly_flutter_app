import 'package:bookly_flutter_app/Core/Utils/styles.dart';
import 'package:bookly_flutter_app/Features/Home/Data/Models/book/book.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/Views/Widgets/book_rating.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/Views/Widgets/custom_book_image.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/Views/Widgets/details_book_actions.dart';
import 'package:flutter/material.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: CustomBookImage(
              imageUrl: book.volumeInfo?.imageLinks?.thumbnail ?? '',
            )),
        const SizedBox(
          height: 43,
        ),
        Text(
          book.volumeInfo?.title ?? '',
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo?.authors?[0] ?? '',
            style: Styles.textStyle20.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          count: book.volumeInfo?.pageCount ?? 0,
        ),
        const SizedBox(
          height: 37,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: DetailsBookActions(
            book: book,
          ),
        ),
      ],
    );
  }
}
