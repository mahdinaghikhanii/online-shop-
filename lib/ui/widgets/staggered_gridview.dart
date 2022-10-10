import 'package:flutter/material.dart';
import 'package:online_shop/common/utils.dart';
import 'package:online_shop/data/entity/product.dart';
import 'package:online_shop/ui/product/details..dart';
import 'package:online_shop/ui/widgets/image.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class StaggeredGridViewsWidgets extends StatelessWidget {
  final List<ProductEntity> products;
  const StaggeredGridViewsWidgets({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: StaggeredGridView.countBuilder(
          padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 12,
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: ((context, index) {
            return InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                        builder: ((context) => ProductDetailsScren(
                            productEntity: products[index]))));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageLoadingService(
                      borderRadius: BorderRadius.circular(20),
                      imageUrl: products[index].image),
                  const SizedBox(height: 12),
                  Text(
                    products[index].title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(overflow: TextOverflow.clip),
                    maxLines: 2,
                  ),
                  Text(
                    products[index].price.withPriceLabel.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                  )
                ],
              ),
            );
          }),
          staggeredTileBuilder: ((index) => const StaggeredTile.fit(1))),
    );
  }
}
