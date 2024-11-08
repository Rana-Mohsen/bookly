import 'package:bookly/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
    //   builder: (context, state) {
    //     if (state is SimilarBooksSuccess) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CustomBookImage(image:"https://cdn.pixabay.com/photo/2018/02/12/10/45/heart-3147976_640.jpg"),
            );
          }),
    );
  }
}
