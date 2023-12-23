part of 'profile_page.dart';

final class _ProfileDetailField extends StatelessWidget {
  const _ProfileDetailField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePageBloc, ProfilePageState>(
      builder: (context, state) {
        if (state.user == null) return const _FailedLoadData();
        if (state.user != null) return _PageFields(user: state.user!);
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
