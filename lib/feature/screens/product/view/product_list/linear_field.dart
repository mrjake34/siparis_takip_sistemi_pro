part of 'product_list_page.dart';

final class _LinearField extends StatelessWidget {
  const _LinearField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status == Status.isLoading) {
          return const LinearProgressIndicator(
            color: ColorName.alternativeButtonColor,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
