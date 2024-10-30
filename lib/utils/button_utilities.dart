import 'package:calculator_version_2/constants/assets.dart';
import 'package:calculator_version_2/constants/button_values.dart';
import 'package:flutter/material.dart';

class ButtonUtilities {

  static Color getButtonColor(value){
    return [
              ButtonValues.clear,
              ButtonValues.delete
           ].contains(value)
              ? Color(AssetData.clrOrDeleteBtnColor)
              : [
                  ButtonValues.multiply,
                  ButtonValues.divide,
                  ButtonValues.add,
                  ButtonValues.subtract,
                  ButtonValues.percentage,
                  ButtonValues.equal
                ].contains(value)
                    ? Color(AssetData.operandOrEqualOrPercentageBtnColor)
                    : Color(AssetData.otherBtnColor);
  }

  static Map<String, dynamic> delete(num1, op, num2){
    if (num2.isNotEmpty){
      num2= num2.substring(0, num2.length-1);
    } else if (op.isNotEmpty){
      op = '';
    } else if (num1.isNotEmpty){
      num1= num1.substring(0, num1.length-1);
    }
    return {
      'number1' : num1,
      'operand' : op,
      'number2' : num2,
    };
  }

  static Map<String, dynamic> parenthesis(numb1,op, numb2,isClicked1,isClicked2){
    String v = '';
    if (numb2.isNotEmpty){
      isClicked2
          ? v = ')'
          : v = '(';
      numb2 += v;
      isClicked2 = !isClicked2;
    } else if (op.isNotEmpty){
        isClicked2
            ? v = ')'
            : v = '(';
        numb2 += v;
        isClicked2 = !isClicked2;
      } else if (numb1.isNotEmpty){
          isClicked1
              ? v = ')'
              : v = '(';
          numb1 += v;
          isClicked1 = !isClicked1;
        } else if (numb1.isEmpty){
            isClicked1 = false;
            v = '(';
            numb1 += v;
            isClicked1 = !isClicked1;
          }
    return{
      'number1' : numb1,
      'number2' : numb2,
      'num1parenthesisClicked' : isClicked1,
      'num2parenthesisClicked' : isClicked2,
      'value' : v,
    };
  }

  static Map<String, dynamic> dot(n1, op, n2, v, boolN1, boolN2){
    if (n1.isEmpty) {
      n1 = '0.';
      boolN1 = true;
    } else if (op.isEmpty){
        switch (boolN1) {
          case (false):
            n1 += '.';
            boolN1 = true;
            break;
          case (true):
            break;
        }
      } else if (n2.isNotEmpty){
          switch (boolN2) {
            case (false):
              n2 += '.';
              boolN2 = true;
              break;
            case (true):
              break;
          }
        } else if (n2.isEmpty){
            n2 = '0.';
            boolN2 = true;
          }
    return {
      'number1': n1,
      'operand' : op,
      'number2' : n2,
      'num1DotIsClicked' : boolN1,
      'num2DotIsClicked' : boolN2,
    };
  }

  static Map<String, dynamic> calculate(num1, op, num2){
    switch (op) {
      case ButtonValues.divide:
        num1 = num1.replaceAll(RegExp(r"\p{P}", unicode: true));
        num1 = (double.parse(num1)/double.parse(num2)).toString();
        break;
      case ButtonValues.multiply:
        num1 = num1.replaceAll(RegExp(r"\p{P}", unicode: true),"");
        num2 = num2.replaceAll(RegExp(r"\p{P}", unicode: true),"");
        num1 = (double.parse(num1)*double.parse(num2)).toString();
        break;
      case ButtonValues.subtract:
        num1 = num1.replaceAll(RegExp(r"\p{P}", unicode: true),"");
        num2 = num2.replaceAll(RegExp(r"\p{P}", unicode: true),"");
        num1 = (double.parse(num1)-double.parse(num2)).toString();
        break;
      case ButtonValues.add:
        num1 = num1.replaceAll(RegExp(r"\p{P}", unicode: true),"");
        num2 = num2.replaceAll(RegExp(r"\p{P}", unicode: true),"");
        num1 = (double.parse(num1)+double.parse(num2)).toString();
        break;
    }
    op = '';
    num2 = '';
    return {
      'number1': num1,
      'operand': op,
      'number2': num2,
    };
  }
}