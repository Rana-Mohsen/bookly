import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/view/widgets/best_seller_list_view.dart';
import 'package:bookly/features/home/presentation/view/widgets/best_seller_list_view_item.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/view/widgets/featured_listview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
       const SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              FeaturedListview(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Best Seller",
                  style: Styles.textStyle18,
                ),
              ),
            ],
          ),
        ),
        SliverList(
        delegate: SliverChildBuilderDelegate(
      //This approach ensures that only the visible items are rendered
      (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child:  BestSellerListView()
        );
      },
      childCount: 1,
    )),
      ],
    );
  }
}
