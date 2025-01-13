import 'package:bookly_flutter_app/Core/Utils/styles.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/Views/Widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class DetailsSimilarBooksSection extends StatelessWidget {
  const DetailsSimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "You can also like",
            style: Styles.textStyle14(context)
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const SimilarBooksListView(),
      ],
    );
  }
}
