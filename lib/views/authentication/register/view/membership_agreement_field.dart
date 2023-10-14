part of 'signup_page.dart';

final class _MembershipAgreementField extends StatelessWidget {
  const _MembershipAgreementField({
    required this.openMembershipAgreement,
  });

  final OpenMembershipAgreement openMembershipAgreement;

  @override
  Widget build(BuildContext context) {
    final agreement = Provider.of<MembershipAgreementProvider>(context).getAgreement;
    return Row(
      children: [
        Checkbox(
          checkColor: Theme.of(context).colorScheme.background,
          value: agreement,
          onChanged: (bool? newValue) {
            context.read<MembershipAgreementProvider>().setAgreement = newValue!;
          },
        ),
        TextButton(
          onPressed: openMembershipAgreement.openMembershipAgreement,
          child: Text(LocaleKeys.mainText_userAgreement.tr()),
        ),
      ],
    );
  }
}
