import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/models/MyPagination.dart';
import 'package:stylish/providers/myProvider.dart';

import '../../../constants.dart';
import '../../../models/MyCategory.dart';

class Categories extends ConsumerWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _categoryList(ref);
  }

  Widget _categoryList(WidgetRef ref) {
    final categories = ref.watch(
      categoriesProvider(
        MyPaginationModel(page: 1, pageSize: 10),
      ),
    );

   // developer.log('log me 35:  ${categories}', name: 'my.app.category');

    return categories.when(
        data: (list) {
          return _buildCategoryList(list!);
        },
        error: (_, __) => const Center(
              child: Text("Error"),
            ),
        loading: () => const Center(child: CircularProgressIndicator()));
  }

  Widget _buildCategoryList(List<MyCategory> categoryList) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) => CategoryCard(
          icon: categoryList[index].fullImagePath,
          title: categoryList[index].categoryName,
          press: () {},
        ),
        separatorBuilder: (context, index) =>
            const SizedBox(width: defaultPadding),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String icon, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: defaultPadding / 2, horizontal: defaultPadding / 4),
        child: Column(
          children: [
            Expanded(child: Image.network(icon)),
            //SvgPicture.asset(icon),
            const SizedBox(height: defaultPadding / 2),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
      ),
    );
  }
}
