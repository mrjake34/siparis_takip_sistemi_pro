part of '../customer_list_page.dart';

final class _ListBuilder extends StatelessWidget {
  const _ListBuilder({
    required this.customerList,
  });

  final List<CustomerModel?> customerList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: customerList.length,
      itemBuilder: (BuildContext context, int index) {
        final customer = customerList[index];
        if (customer == null) return const SizedBox();
        return ListCard(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: _CustomerListCardCustomerField(customer: customer),
              ),
              _CardMoreButton(customer: customer),
            ],
          ),
        );
      },
    );
  }
}
