import 'package:bookly_flutter_app/Core/Utils/styles.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/Views/Widgets/best_seller_list_view.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/Views/Widgets/custom_home_app_bar.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/Views/Widgets/featured_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomHomeAppBar(),
              ),
              FeaturedBooksListView(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Newest Books",
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        BestSellerListView()
      ],
    );
  }
}
