import 'package:ecommerce_admin/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TTableHeader extends StatelessWidget {
  const TTableHeader({super.key, this.onPressed, required this.buttonText, this.searchController, this.searchOnChanged});

  final Function()? onPressed;
  final String buttonText;
  final TextEditingController? searchController;
  final Function(String)? searchOnChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: !TDeviceUtils.isDesktopScreen(context) ? 3 : 1,
          child: TDeviceUtils.isDesktopScreen(context)
          // Nếu là desktop, giữ nguyên code ban đầu
              ? Row(
            children: [
              SizedBox(
                width: 200, // Kích thước cố định của nút
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(buttonText),
                ),
              ),
            ],
          )
          // Nếu là mobile, thay đổi code thành một ElevatedButton không có SizedBox
              : ElevatedButton(
            onPressed: onPressed,
            child: Text(buttonText),
          ),
        ),
        Expanded(
          flex: !TDeviceUtils.isDesktopScreen(context) ? 2 : 1,
          child: !TDeviceUtils.isDesktopScreen(context)
              ? IconButton(
            icon: const Icon(Iconsax.search_normal),
            onPressed: () {
              // Mở hộp thoại tìm kiếm hoặc điều hướng đến màn hình tìm kiếm
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Search here..."),
                  content: TextFormField(
                    controller: searchController,
                    onChanged: searchOnChanged,
                    decoration: const InputDecoration(
                      hintText: 'Input ...',
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Close"),
                    ),
                  ],
                ),
              );
            },
          )
              : TextFormField(
            controller: searchController,
            onChanged: searchOnChanged,
            decoration: const InputDecoration(
              hintText: 'Search here...',
              prefixIcon: Icon(Iconsax.search_normal),
            ),
          ),
        )
      ],
    );
  }
}
