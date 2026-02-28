import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopverse/core/util/constants/spacing.dart';
import 'package:shopverse/core/util/cubit/home_states.dart';
import 'package:shopverse/features/home/presentation/widgets/banners_screen.dart';
import 'package:shopverse/features/home/presentation/widgets/categories.dart';
import 'package:shopverse/core/util/cubit/home_cubit.dart';
import 'package:shopverse/features/home/presentation/widgets/products_by_category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const BannersHomeWidget(),
                  verticalSpace30,
                  const CategoriesListWidget(),
                  BlocBuilder<HomeCubit, HomeStates>(
                    buildWhen: (prev, current) {
                      return current is GetCategoriesLoadingState ||
                          current is GetCategoriesErrorState ||
                          current is GetCategoriesSuccessState;
                    },
                    builder: (context, state) {
                      if (state is GetCategoriesLoadingState) {
                        return const CategoriesHomeWidgetLoading();
                      }

                      if (state is GetCategoriesErrorState) {
                        return SizedBox.shrink();
                      }

                      return ProductsHomeWidget();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
