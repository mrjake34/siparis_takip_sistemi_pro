part of '../customer_list_page.dart';

final class _CardMoreButton extends StatelessWidget {
  const _CardMoreButton({
    required this.customer,
  });

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTapDown: (details) {
          CardMoreButton.openMenu<void>(
            context: context,
            id: customer.id ?? '',
            function: () => context.read<CustomerBloc>().add(
                  CustomerDeleteEvent(
                    id: customer.id ?? '',
                    cookie: context.read<LoginBloc>().state.cookie,
                  ),
                ),
            offset: details.globalPosition,
          );
        },
        child: const Icon(
          Icons.more_vert,
        ),
      ),
    );
  }
}
