import 'package:bookly_flutter_app/Core/Utils/app_router.dart';
import 'package:bookly_flutter_app/Core/Utils/service_locator.dart';
import 'package:bookly_flutter_app/Features/Home/Data/Repo/home_repo.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/ViewModel/FeaturedBooksCubit/featured_books_cubit.dart';
import 'package:bookly_flutter_app/Features/Home/Presentation/ViewModel/NewestBooksCubit/newest_books_cubit.dart';
import 'package:bookly_flutter_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepo>())..getNewestBooks(),
        ),
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepo>())..getFeaturedBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
