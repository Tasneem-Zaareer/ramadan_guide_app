import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:ramadan_guide_app/features/home/view_mdoel/cubit.dart';
import '../../../core/di/dependency_injection_service.dart';
import '../../../core/widgets/snackbar/custom_sack_bar.dart';
import '../../prayer_times/views/prayer_times_view.dart';
import 'widgets/categories_gridview_widget.dart';
import 'widgets/featured_img_widget.dart';
import 'widgets/gifts_widget.dart';
import 'widgets/quiz_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DependencyInjectionService.getIt<HomeCubit>(),
      child: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is UserNotEnableLocationState) {
            showCustomSnackbar(context: context, content: Text(state.message));
          } else if (state is GoToPrayerTimesViewState) {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: PrayerTimeView(locationModel: state.locationModel),
              withNavBar: false, // Hides the bottom navigation bar
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  const FeatureImage(),
                  const CategoriesGridviewWidget(),
                  const GiftsWidget(),
                  const QuizWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
