import 'package:flutter/material.dart';
import 'package:toboggan_hills/src/utils/constants/colors.dart';
import 'package:toboggan_hills/src/utils/constants/sizes.dart';

class LocationSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onLocationPressed;
  final ValueChanged<String>? onSubmitted;

  const LocationSearchBar({
    super.key,
    required this.controller,
    required this.onLocationPressed,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: CustomSizes.spaceBtwSections,
          vertical: CustomSizes.spaceBtwItems),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CustomSizes.borderRadiusMd),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.location_on,
            color: CustomColors.accentColor,
          ),
          const SizedBox(width: CustomSizes.spaceBtwItems),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Search location...',
                border: InputBorder.none,
              ),
              onSubmitted: onSubmitted,
            ),
          ),
          const SizedBox(width: CustomSizes.spaceBtwItems),
          GestureDetector(
            onTap: onLocationPressed,
            child: const Icon(
              Icons.my_location,
              color: CustomColors.accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
