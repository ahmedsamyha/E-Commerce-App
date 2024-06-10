import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/home_cubit/home_cubit.dart';
import 'package:snapshop/modules/shopping/presentation/components/custom_app_bar.dart';
import 'package:snapshop/modules/shopping/presentation/components/search_grid_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    BlocProvider.of<HomeCubit>(context)
                        .filterData(value: value);
                  });
                },
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  labelText: 'Search',
                ),
              ),
            ),
            const SearchGridView(),
          ],
        ),
      ),
    );
  }
}
