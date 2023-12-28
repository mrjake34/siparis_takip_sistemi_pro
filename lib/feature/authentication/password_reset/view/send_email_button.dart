part of 'password_reset_page.dart';

final class _SendEmailButton extends StatelessWidget {
  const _SendEmailButton({
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordResetCubit, PasswordResetState>(
      listener: (context, state) {
        if (state.status == Status.isDone) {
          CustomDialog.showCustomDialog<void>(
            context,
            Text(LocaleKeys.succes_resetPasswordSent.tr()),
          );
        } else if (state.status == Status.isFailed) {
          CustomDialog.showCustomDialogError<void>(
            context,
            Text(
              LocaleKeys.errors_errorWhileSendingPasswordResetEmail.tr(),
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.status == Status.isLoading) {
          return const LoadingButton();
        }
        return MainElevatedIconButton(
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              context.read<PasswordResetCubit>().sendResetPasswordEmail();
            }
          },
          label: Text(
            LocaleKeys.mainText_resetPassword.tr(),
          ),
          icon: const Icon(Icons.mail_outline),
        );
      },
    );
  }
}
