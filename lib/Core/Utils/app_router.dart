import 'package:bookly_flutter_app/Core/Utils/service_locator.dart';
import 'package:bookly_flutter_app/Features/Home/Data/Models/book/book.dart';
import 'package:bookly_flutter_app/Features/Home/Data/Repo/home_repo.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/ViewModel/SimilarBooksCubit/similar_books_cubit.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/Views/book_details_view.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/Views/home_view.dart';
import 'package:bookly_flutter_app/Features/Search/Presentation/view/search_view.dart';
import 'package:bookly_flutter_app/Features/Splash/Presentation/View/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kBookDetailsView,
      builder: (context, state) => BlocProvider(
        create: (context) => SimilarBooksCubit(getIt.get<HomeRepo>()),
        child: BookDetailsView(
          book: state.extra as Book,
        ),
      ),
    ),
    GoRoute(
      path: kSearchView,
      builder: (context, state) => const SearchView(),
    ),
  ]);
}
