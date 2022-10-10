import 'package:flutter/material.dart';

import 'package:online_shop/data/entity/category.dart';

class ListChoiceChip extends StatefulWidget {
  final List<CategoryEntity> categoryEntity;

  const ListChoiceChip(this.categoryEntity, {super.key});
  @override
  State<ListChoiceChip> createState() => ListChoiceChipState();
}

int selectChip = 0;

class ListChoiceChipState extends State<ListChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          itemCount: widget.categoryEntity.length,
          padding: const EdgeInsets.only(left: 16),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ChoiceChip(
                backgroundColor: const Color(0xFF2A2A2A),
                selectedColor: const Color(0xFF979797),
                padding: const EdgeInsets.all(2),
                onSelected: (value) {
                  setState(() {
                    selectChip = index;
                  });
                },
                label: Text(
                  widget.categoryEntity[index].categoryName,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white),
                ),
                selected: selectChip == index,
              ),
            );
          }),
    );
  }
}
