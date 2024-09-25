import 'package:bookly_flutter_app/Core/Utils/launch_url_helper.dart';
import 'package:bookly_flutter_app/Core/Widgets/custom_elevated_button.dart';
import 'package:bookly_flutter_app/Features/Home/Data/Models/book/book.dart';
import 'package:flutter/material.dart';

class DetailsBookActions extends StatelessWidget {
  const DetailsBookActions({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: CustomElevatedButton(
          backgroundColor: Colors.white,
          textColor: Colors.black,
          title: r"19.99$",
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
        )),
        Expanded(
            child: CustomElevatedButton(
                backgroundColor: const Color(0xffEF8262),
                textColor: Colors.white,
                title: "Free Preview",
                fontSize: 16,
                onPressed: () {
                  LaunchUrlHelper().launchURL(
                      Uri.parse(book.volumeInfo?.previewLink.toString() ??
                          'https://google.com/'),
                      false);
                },
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12))))
      ],
    );
  }
}
