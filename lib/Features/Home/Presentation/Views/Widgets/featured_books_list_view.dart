import 'package:bookly_flutter_app/Core/Utils/app_router.dart';
import 'package:bookly_flutter_app/Core/Widgets/custom_error_widget.dart';
import 'package:bookly_flutter_app/Core/Widgets/custom_loading_indicator.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/ViewModel/FeaturedBooksCubit/featured_books_cubit.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/Views/Widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              itemCount: state.featuredBooks.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kBookDetailsView,
                          extra: state.featuredBooks[index]);
                    },
                    child: CustomBookImage(
                      imageUrl: state.featuredBooks[index].volumeInfo
                              ?.imageLinks?.thumbnail ??
                          '',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
