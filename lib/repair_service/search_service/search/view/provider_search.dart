import 'package:flutter/material.dart' hide SearchDelegate;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lottie/lottie.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/search_custom.dart';
import '../cubit/search_cubit.dart';
import '../widgets/search_empty.dart';
import '../widgets/search_initial.dart';
import '../widgets/search_result.dart';

class ProviderSearch extends SearchDelegate<String> {
  ProviderSearch({
    required this.searchCubit,
    required String hintText,
    required super.searchFieldStyle,
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );
  final SearchCubit searchCubit;
  final _rangeFieldKey =
      GlobalKey<FormBuilderFieldState<FormBuilderField<double>, double>>();

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchCubit.searchByKeyword(query);
    return BlocBuilder<SearchCubit, SearchState>(
      bloc: searchCubit,
      builder: (context, state) => state.when(
        initial: SearchInitial.new,
        loading: () => Center(
          child: LottieBuilder.asset(Assets.screens.loadingPrimaryColor),
        ),
        empty: (keyword, resultCount) => SearchEmpty(
          keyword: keyword,
          resultCount: resultCount,
        ),
        result: (keyword, resultCount, type, results) => SearchResult(
          keyword: keyword,
          resultCount: resultCount,
          results: results,
          type: type,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
    // final radius = _rangeFieldKey.currentState?.value ?? 50;
    // searchCubit.searchByKeywordWithinRadius(query, radius);

    // return BlocBuilder<SearchCubit, SearchState>(
    //   bloc: searchCubit,
    //   builder: (context, state) => state.when(
    //     initial: SearchInitial.new,
    //     loading: () => Center(
    //       child: LottieBuilder.asset(Assets.screens.loading),
    //     ),
    //     empty: (keyword, resultCount) => SearchEmpty(
    //       keyword: keyword,
    //       resultCount: resultCount,
    //     ),
    //     result: (keyword, resultCount, providers) => SearchResult(
    //       keyword: keyword,
    //       resultCount: resultCount,
    //       providers: providers,
    //     ),
    //   ),
    // );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [Container()];
  }
}
