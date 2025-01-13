import 'package:bookly_flutter_app/Core/Utils/styles.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/Views/Widgets/best_seller_list_view.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/Views/Widgets/custom_home_app_bar.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/Views/Widgets/featured_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomHomeAppBar(),
              ),
              const FeaturedBooksListView(),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Newest Books",
                  style: Styles.textStyle18(context),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        const BestSellerListView()
      ],
    );
  }
}
