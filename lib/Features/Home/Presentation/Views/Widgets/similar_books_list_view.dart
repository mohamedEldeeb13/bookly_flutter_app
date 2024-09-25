import 'package:bookly_flutter_app/Core/Widgets/custom_error_widget.dart';
import 'package:bookly_flutter_app/Core/Widgets/custom_loading_indicator.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/ViewModel/SimilarBooksCubit/similar_books_cubit.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/Views/Widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/Utils/app_router.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.17,
            child: ListView.builder(
              itemCount: state.similarBooks.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kBookDetailsView,
                          extra: state.similarBooks[index]);
                    },
                    child: CustomBookImage(
                      imageUrl: state.similarBooks[index].volumeInfo?.imageLinks
                              ?.thumbnail ??
                          '',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
