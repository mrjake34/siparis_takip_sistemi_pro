part of 'register_page.dart';

final class _MembershipAgreementField extends StatelessWidget {
  const _MembershipAgreementField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Row(
          children: [
            Checkbox(
              checkColor: Theme.of(context).colorScheme.background,
              value: state.agreementCheck,
              onChanged: (bool? newValue) =>
                  context.read<RegisterCubit>().agreementCheck(value: newValue),
            ),
            TextButton(
              onPressed: OpenMembershipAgreement.openMembershipAgreement,
              child: Text(LocaleKeys.mainText_userAgreement.tr()),
            ),
          ],
        );
      },
    );
  }
}
