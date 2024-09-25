import 'package:bookly_flutter_app/Core/Widgets/custom_error_widget.dart';
import 'package:bookly_flutter_app/Core/Widgets/custom_loading_indicator.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/ViewModel/NewestBooksCubit/newest_books_cubit.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/Views/Widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: state.newestBooks.length, (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: BookListViewItem(
                book: state.newestBooks[index],
              ),
            );
          }));
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
              child: CustomErrorWidget(errorMessage: state.errorMessage));
        } else {
          return const SliverToBoxAdapter(child: CustomLoadingIndicator());
        }
      },
    );

    // return ListView.builder(
    //   padding: EdgeInsets.zero,
    //   itemCount: 20,
    //   physics: const NeverScrollableScrollPhysics(),
    //   itemBuilder: (BuildContext context, int index) {
    //     return const Padding(
    //       padding: EdgeInsets.symmetric(vertical: 10),
    //       child: BestSellerListViewItem(),
    //     );
    //   },
    // );
  }
}
