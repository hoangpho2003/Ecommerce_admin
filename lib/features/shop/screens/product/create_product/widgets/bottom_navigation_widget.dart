import 'package:flutter/material.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../utils/constants/sizes.dart';

class ProductBottomNavigationButtons extends StatelessWidget {
  const ProductBottomNavigationButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Discard button
          OutlinedButton(onPressed: () {}, child: const Text('Discard')),
          const SizedBox(width: TSizes.spaceBtwItems / 2),
          // Save Changes button
          SizedBox(width: 160, child: ElevatedButton(onPressed: () {}, child: const Text('Save Changes'))),
        ],
      ),
    );
  }
}
