import 'package:calculator_version_2/constants/assets.dart';
import 'package:calculator_version_2/constants/button_values.dart';
import 'package:calculator_version_2/utils/button_utilities.dart';
import 'package:flutter/material.dart';

class CalcElevatedButtons extends StatelessWidget {
  void Function()? onPressedElevatedButton;
  final String value;
  CalcElevatedButtons({super.key, required this.onPressedElevatedButton, required this.value, });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedElevatedButton,
      style: ElevatedButton.styleFrom(
        backgroundColor: ButtonUtilities.getButtonColor(value),
        foregroundColor: [ButtonValues.clear, ButtonValues.delete].contains(value)
            ? Color(AssetData.textOneInBtnColor)
            : Color(AssetData.textTwoInBtnColor),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AssetData.borderRadius)
        ),
        fixedSize: Size(AssetData.btnWidth, AssetData.btnHeight),
      ),
      child: Text(
        value,
        style: TextStyle(
            fontSize: AssetData.btnFontSize
        ),
      ),);
  }
}
