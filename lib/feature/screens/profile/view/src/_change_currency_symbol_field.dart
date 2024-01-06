part of '../profile_page.dart';

final class _ChangeCurrencySymbolField extends StatelessWidget {
  const _ChangeCurrencySymbolField();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      trailing: const Icon(Icons.keyboard_double_arrow_down),
      title: Text(LocaleKeys.mainText_changeCurrencySymbol.tr()),
      children: [
        Wrap(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.turkishLiraSign),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.euroSign),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.dollarSign),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.sterlingSign),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.rubleSign),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.manatSign),
            ),
          ],
        ),
      ],
    );
  }
}
