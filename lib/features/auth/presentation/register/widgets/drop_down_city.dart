import 'package:flutter/material.dart';
import 'package:rivo_app/core/constant/colors.dart';

class CustomDropDownCities extends StatelessWidget {
  final void Function(int?)? onChanged;
  final int city;
  const CustomDropDownCities(
      {super.key, required this.onChanged, required this.city});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: DropdownButtonFormField(
          hint: const Text("المحافظة"),
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 3, horizontal: 7),
              filled: true,
              hintText: "المحافظة",
              hintStyle: const TextStyle(
                fontFamily: "ArbFONTS-Almarai-Bold",
              ),
              fillColor: AppColors.secoundColorOne.withOpacity(0.7),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none)),
          items: [
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
          ]
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e == 1
                        ? "حلب"
                        : e == 2
                            ? "دمشق"
                            : e == 3
                                ? "الحسكة"
                                : e == 4
                                    ? "درعا"
                                    : e == 5
                                        ? "حمص"
                                        : e == 5
                                            ? "حماه"
                                            : e == 7
                                                ? "القنيطرة"
                                                : "السويداء"),
                  ))
              .toList(),
          value: city,
          onChanged: onChanged),
    );
  }
}
