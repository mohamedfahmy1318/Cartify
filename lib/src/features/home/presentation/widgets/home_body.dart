part of '../imports/presentaion_imports.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return switch (state.baseStatus) {
          BaseStatus.initial ||
          BaseStatus.loading =>
            CustomLoading.showLoadingView(),
          BaseStatus.error => Center(child: Text(state.errorMessage)),
          BaseStatus.success => _PlayerList(players: state.players)
        };
      },
    );
  }
}
