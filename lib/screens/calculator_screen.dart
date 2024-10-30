import 'package:calculator_version_2/constants/assets.dart';
import 'package:calculator_version_2/constants/button_values.dart';
import 'package:calculator_version_2/screenComponenets/calc_appbar.dart';
import 'package:calculator_version_2/screenComponenets/calc_elev_btns.dart';
import 'package:calculator_version_2/utils/button_utilities.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String number1 = '';
  String operand = '';
  String number2 = '';
  String value = '';
  bool operandIsChosen = false;
  bool num1parenthesisClicked = false;
  bool num2parenthesisClicked = false;
  bool operandIsClicked = false;
  bool num1DotIsClicked = false;
  bool num2DotIsClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalculatorAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(AssetData.paddingUpperContainer),
              child: Container(
                padding: EdgeInsets.all(AssetData.paddingTextInUpperContainer),
                alignment: Alignment.bottomRight,
                width: double.maxFinite,
                color: Color(AssetData.areaOfEquationColor),
                child: Text(
                  "$number1$operand$number2".isEmpty
                      ? "0"
                      : "$number1$operand$number2",
                  style: TextStyle(
                      color: Color(AssetData.numbersOfEquationColor),
                      fontWeight: FontWeight.bold,
                      fontSize: AssetData.equationFontSize
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Wrap(
              runSpacing: 6,
              spacing: 6,
              children: ButtonValues.buttonValuesList
                  .map(
                        (value) => CalcElevatedButtons(
                          onPressedElevatedButton: () {
                            setState(() {
                              onButtonTap(value);
                            });
                          },
                          value: value,
                        )
                )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
  void onButtonTap(value){
    if (value != ButtonValues.dot && int.tryParse(value) == null){
      if (value == ButtonValues.clear && number1.isNotEmpty){
        operandIsChosen = false; num1parenthesisClicked = false; num2parenthesisClicked = false ;operandIsClicked = false; num1DotIsClicked = false; num2DotIsClicked = false; value = ''; number1 = ''; operand = ''; number2 = '';
      } else if (value == ButtonValues.clear && number1.isEmpty) {
        value = '';
        }
      else if (value == ButtonValues.delete){
        var deletedResult = ButtonUtilities.delete(number1, operand, number2);
        number1 = deletedResult['number1']; operand = deletedResult['operand']; number2 = deletedResult['number2'];
        if (number1.isEmpty){ operandIsChosen = false; num1parenthesisClicked = false; num2parenthesisClicked = false ; operandIsClicked = false; num1DotIsClicked = false; num2DotIsClicked = false; }
      } else if (value != ButtonValues.percentage && value != ButtonValues.parenthesis && value != ButtonValues.delete && value != ButtonValues.equal){
          switch (operandIsChosen){
            case false:
              operand = value;
              operandIsChosen = !operandIsChosen;
              break;
            case true:
              break;
          }
        } else if (value == ButtonValues.parenthesis) {
            var resultWithParenthesis = ButtonUtilities.parenthesis(number1,operand, number2, num1parenthesisClicked, num2parenthesisClicked);
            number1 = resultWithParenthesis['number1']; number2 = resultWithParenthesis['number2']; num1parenthesisClicked = resultWithParenthesis['num1parenthesisClicked'];num2parenthesisClicked = resultWithParenthesis['num2parenthesisClicked']; value = resultWithParenthesis['value'];
          } else if (value == ButtonValues.percentage){
              if (number2.isNotEmpty){
                number2 = (double.parse(number2)/100).toString();
              } else if (number1.isNotEmpty){
                  number1 = (double.parse(number1)/100).toString();
                }
            } else if (value == ButtonValues.equal && number2.isNotEmpty){
                var result = ButtonUtilities.calculate(number1, operand, number2);
                number1 = result['number1'] ; operand = result['operand'] ; number2 = result['number2'] ;
                operandIsChosen = false;
              }
    } else if(value == ButtonValues.dot) {
        var resultWithDot = ButtonUtilities.dot(number1, operand, number2, value,num1DotIsClicked,num2DotIsClicked);
        number1 = resultWithDot['number1']; operand = resultWithDot['operand']; number2 = resultWithDot['number2']; num1DotIsClicked = resultWithDot['num1DotIsClicked']; num2DotIsClicked = resultWithDot['num2DotIsClicked'];
      } else if (operand.isEmpty){
          number1 += value;
        } else if (operand.isNotEmpty){
            number2 += value;
        }
  }
}