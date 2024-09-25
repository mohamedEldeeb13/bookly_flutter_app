import 'package:bookly_flutter_app/Features/Home/Data/Models/book/book.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/Views/Widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(
            book: Book(),
          ),
        );
      },
    );
  }
}
