import 'package:flutter/material.dart';
import 'package:online_shop/data/entity/product.dart';
import 'package:online_shop/ui/widgets/image.dart';
import 'package:online_shop/common/utils.dart';

class HorizontalListView extends StatelessWidget {
  final List<ProductEntity> productEntity;
  const HorizontalListView({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 270,
      child: ListView.builder(
          itemCount: 5,
          padding: const EdgeInsets.only(left: 16, top: 16),
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Container(
              width: 140,
              padding: const EdgeInsets.only(right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 140,
                        height: 156,
                        child: ImageLoadingService(
                            borderRadius: BorderRadius.circular(20),
                            imageUrl: productEntity[index].image),
                      ),
                      Positioned(
                          left: 60,
                          right: 0,
                          top: 0,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_border))),
                      Positioned(
                          left: 60,
                          right: 0,
                          bottom: 0,
                          child: IconButton(
                              color: Theme.of(context).colorScheme.primary,
                              onPressed: () {},
                              icon: const Icon(Icons.card_travel))),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    productEntity[index].title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(overflow: TextOverflow.clip),
                    maxLines: 2,
                  ),
                  Text(
                    productEntity[index].price.withPriceLabel.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                  )
                ],
              ),
            );
          })),
    );
  }
}
