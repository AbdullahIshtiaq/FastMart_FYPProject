import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);

class SearchForm extends StatelessWidget {
  const SearchForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        //height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
          boxShadow: [
            BoxShadow(
              color: lightGrey,
              blurRadius: 0.3,
              spreadRadius: 0.5,
              offset: Offset(0.5, 0.5), // shadow direction: bottom right
            )
          ],
        ),
        child: TextFormField(
          onSaved: (value) {},
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Search",
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            border: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            errorBorder: outlineInputBorder,
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding / 2),
              child: SizedBox(
                width: 40,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: SvgPicture.asset("assets/icons/Filter.svg"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
