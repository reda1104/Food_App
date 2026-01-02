import 'package:flutter/material.dart';
import 'package:food_delivery/utilities/app_assets.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final nameText = Text(
      "Mohamed Reda",
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          if (!isLandScape) ...[
            ProfilePic(size.width * 0.7, size.height * 0.25),
            SizedBox(height: 10),
            nameText,
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ordersVouchersItem(context, number: 50, name: "Orders"),
                ordersVouchersItem(context, number: 10, name: "Vouchers"),
              ],
            ),
            SizedBox(height: 16),
          ],

          if (isLandScape) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    ProfilePic(size.width * 0.25, size.height * 0.4),
                    nameText,
                  ],
                ),
                ordersVouchersItem(context, number: 50, name: "Orders"),
                ordersVouchersItem(context, number: 10, name: "Vouchers"),
              ],
            ),
          ],
          Divider(thickness: 2, indent: 20, endIndent: 20),
          ListTileWidget(
            context,
            icon: Icons.shopping_cart,
            title: "Past orders",
          ),
          Divider(thickness: 2, indent: 20, endIndent: 20),
          ListTileWidget(
            context,
            icon: Icons.card_giftcard,
            title: "Available vouchers",
          ),
          Divider(thickness: 2, indent: 20, endIndent: 20),
        ],
      ),
    );
  }

  Widget ordersVouchersItem(
    BuildContext context, {
    required int number,
    required String name,
  }) {
    return Column(
      children: [
        Text(
          number.toString(),
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Text(name, style: const TextStyle(fontSize: 18)),
      ],
    );
  }

  Widget ProfilePic(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(AppAssets.profilePic),
          alignment: Alignment(0, -0.5),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget ListTileWidget(
    BuildContext context, {
    required String title,
    required IconData icon,
    String? subTitle,
  }) {
    final size = MediaQuery.of(context).size;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return ListTile(
      onTap: () {
        debugPrint("$title is pressed");
      },
      title: Text(title, style: TextStyle(fontSize: isLandScape ? 22 : 16)),
      leading: Icon(
        icon,
        color: Theme.of(context).primaryColor,
        size: isLandScape ? size.height * 0.09 : size.height * 0.035,
      ),
      subtitle: subTitle != null ? Text(subTitle) : null,
      trailing: Icon(
        Icons.chevron_right,
        color: Theme.of(context).primaryColor,
        size: isLandScape ? size.height * 0.09 : size.height * 0.035,
      ),
    );
  }
}
