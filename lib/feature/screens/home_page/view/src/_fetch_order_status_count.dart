part of '../home_page.dart';

final class _FetchOrderStatusCount extends StatelessWidget {
  const _FetchOrderStatusCount();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        _PendingOrdersCountField(),
        SizedBox(
          height: 10,
        ),
        _ProcessOrdersCountField(),
        SizedBox(
          height: 10,
        ),
        _OnTheWayOrdersCountField(),
        SizedBox(
          height: 10,
        ),
        _DoneOrdersCountField(),
      ],
    );
  }
}
