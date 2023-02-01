import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petsguide/controller/search_controllerr.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final _searchController = TextEditingController();

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchWithDebounce);
  }

  _onSearchWithDebounce() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 100), () {
      searchText();
    });
  }

  void searchText() {
    final SearchController searchController = Get.put(SearchController());
    searchController.searchByRazza(_searchController.text);
  }

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
    _searchController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextField(  
      controller: _searchController,
      cursorColor: Colors.grey,
      style: theme.textTheme.bodyMedium,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: Colors.grey,),
        contentPadding: EdgeInsets.all(15),
        hintText: 'Cerca...',
        hintStyle: theme.textTheme.bodyMedium,
        border: InputBorder.none,
        
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}