import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.23,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/images/profile.jpeg"),
              alignment: Alignment(0, -0.5),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Mohamed Reda",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ordersVouchersItem(context, number: 50, name: "Orders"),
            ordersVouchersItem(context, number: 10, name: "Vouchers"),
          ],
        ),
        SizedBox(height: 16),
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

  Widget ListTileWidget(
    BuildContext context, {
    required String title,
    required IconData icon,
    String? subTitle,
  }) {
    final size = MediaQuery.of(context).size;
    return ListTile(
      onTap: () {
        debugPrint("$title is pressed");
      },
      title: Text(title),
      leading: Icon(
        icon,
        color: Theme.of(context).primaryColor,
        size: size.height * 0.035,
      ),
      subtitle: subTitle != null ? Text(subTitle) : null,
      trailing: Icon(
        Icons.chevron_right,
        color: Theme.of(context).primaryColor,
        size: size.height * 0.035,
      ),
    );
  }
}
