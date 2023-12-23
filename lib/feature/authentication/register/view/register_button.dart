part of 'register_page.dart';

final class _RegisterButton extends StatelessWidget {
  const _RegisterButton({
    required this.formKey,
    required this.state,
  });

  final GlobalKey<FormBuilderState> formKey;
  final RegisterState state;

  @override
  Widget build(BuildContext context) {
    final agreement =
        Provider.of<MembershipAgreementProvider>(context).getAgreement;
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: state.status == Status.isLoading
              ? const LoadingButton()
              : MainElevatedIconButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      if (agreement == true) {
                        context.read<RegisterCubit>().postRegisterModel();
                      } else {
                        utils.errorSnackBar(
                          LocaleKeys.errors_errorUserAgreement.tr(),
                        );
                      }
                    } else {
                      utils.errorSnackBar(
                        LocaleKeys.errors_pleaseEnterAllField.tr(),
                      );
                    }
                  },
                  label: Text(
                    LocaleKeys.mainText_signup.tr(),
                  ),
                  icon: const Icon(
                    Icons.account_circle,
                  ),
                ),
        ),
      ],
    );
  }
}
