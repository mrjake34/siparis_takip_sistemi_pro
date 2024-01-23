part of '../customer_list_page.dart';

final class _CustomerListCardCustomerField extends StatelessWidget {
  const _CustomerListCardCustomerField({
    required this.customer,
  });

  final CustomerModel customer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Text(
              customer.name ?? '',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text(customer.adress ?? ''),
            subtitle: Text(customer.phone ?? ''),
          ),
        ],
      ),
    );
  }
}
