import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int primaryColor = 0xff44cee0;
  final int grayColor = 0xffe8e8e8;
  final int numberColor = 0xff4e4e4e;

  final mathArray = ["+", "-", "×", "÷"];

  String? firstNumber;
  String? secondNumber;
  int? math;

  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sizeBox = ((MediaQuery.of(context).size.width) - 5) / 4;
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "RAD",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff707070)),
                ),
                SizedBox(
                    height: 20,
                    width: 10,
                    child: SvgPicture.asset(
                      "lib/assets/icons/ellipsis-vertical.svg",
                    ))
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: const BoxDecoration(color: Colors.white),
              child: TextFormField(
                controller: controller,
                autofocus: true,
                showCursor: true,
                readOnly: true,
                cursorColor: Color(primaryColor),
                cursorWidth: 3,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                    border: InputBorder.none, fillColor: Color(primaryColor)),
                style: TextStyle(
                  color: Color(primaryColor),
                  fontSize: 40,
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: const Center(
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xffd3d3d3),
              ),
            ),
          ),
          Container(
            color: Color(grayColor),
            height: sizeBox * 5 + 6,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(1),
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              crossAxisCount: 4,
              children: <Widget>[
                baseButton(
                  text: "C",
                  textColor: primaryColor,
                  click: () {
                    clickDeleteAll();
                  },
                ),
                baseButton(
                  text: "%",
                  textColor: primaryColor,
                  click: () {},
                ),
                baseButton(
                  text: "",
                  icon: Icons.backspace_outlined,
                  textColor: primaryColor,
                  click: () {
                    clickDeleteOne();
                  },
                ),
                baseButton(
                  text: "",
                  icon: Icons.add,
                  textColor: primaryColor,
                  click: () {
                    clickMath(0);
                  },
                ),
                baseButton(
                  text: "7",
                  textColor: numberColor,
                  click: () {
                    clickNumber("7");
                  },
                ),
                baseButton(
                  text: "8",
                  textColor: numberColor,
                  click: () {
                    clickNumber("8");
                  },
                ),
                baseButton(
                  text: "9",
                  textColor: numberColor,
                  click: () {
                    clickNumber("9");
                  },
                ),
                baseButton(
                  text: "-",
                  icon: Icons.maximize,
                  textColor: primaryColor,
                  click: () {
                    clickMath(1);
                  },
                ),
                baseButton(
                  text: "4",
                  textColor: numberColor,
                  click: () {
                    clickNumber("4");
                  },
                ),
                baseButton(
                  text: "5",
                  textColor: numberColor,
                  click: () {
                    clickNumber("5");
                  },
                ),
                baseButton(
                  text: "6",
                  textColor: numberColor,
                  click: () {
                    clickNumber("6");
                  },
                ),
                baseButton(
                  text: "",
                  icon: Icons.close,
                  textColor: primaryColor,
                  click: () {
                    clickMath(2);
                  },
                ),
                baseButton(
                  text: "1",
                  textColor: numberColor,
                  click: () {
                    clickNumber("1");
                  },
                ),
                baseButton(
                  text: "2",
                  textColor: numberColor,
                  click: () {
                    clickNumber("2");
                  },
                ),
                baseButton(
                  text: "3",
                  textColor: numberColor,
                  click: () {
                    clickNumber("3");
                  },
                ),
                baseButton(
                  text: "",
                  textColor: primaryColor,
                  svgPath: "lib/assets/icons/divider.svg",
                  click: () {
                    clickMath(3);
                  },
                ),
                baseButton(
                  text: "",
                  icon: Icons.content_copy,
                  textColor: primaryColor,
                  click: () {},
                ),
                baseButton(
                  text: "0",
                  textColor: numberColor,
                  click: () {
                    clickNumber("0");
                  },
                ),
                baseButton(
                  text: ".",
                  textColor: numberColor,
                  click: () {
                    clickDot();
                  },
                ),
                baseButton(
                  text: "=",
                  bgColor: primaryColor,
                  textColor: 0xffffffff,
                  click: () {
                    clickEqual();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget baseButton(
      {required String text,
      required int textColor,
      int bgColor = 0xffffffff,
      IconData? icon,
      String? svgPath,
      double fontSize = 30,
      required VoidCallback click}) {
    return GestureDetector(
      onTap: click,
      child: Container(
        decoration: BoxDecoration(color: Color(bgColor)),
        child: Center(
          child: icon != null
              ? Icon(
                  icon,
                  color: Color(textColor),
                )
              : svgPath != null
                  ? SizedBox(height: 24, child: SvgPicture.asset(svgPath))
                  : Text(
                      text,
                      style: TextStyle(
                          fontSize: fontSize, color: Color(textColor)),
                    ),
        ),
      ),
    );
  }

  void clickNumber(String number) {
    controller.text = controller.text + number;
  }

  void clickDeleteAll() {
    setState(() {
      controller.text = "";
      firstNumber = null;
      secondNumber = null;
      math = null;
    });
  }

  void clickDeleteOne() {
    if (controller.text != "" && controller.text.isNotEmpty) {
      if (mathArray.contains(controller.text[controller.text.length - 1])) {
        setState(() {
          math = null;
          firstNumber = null;
        });
      }
      controller.text =
          controller.text.substring(0, controller.text.length - 1);
    }
  }

  // code meaning: 0 <=> +, 1 <=> -, 2 <=> *, 3 <=> :
  void clickMath(int code) {
    // check first character
    if (controller.text.isEmpty && firstNumber == null) {
      if (code == 1) {
        controller.text = mathArray[1];
      }
    } else {
      if (mathArray.contains(controller.text[controller.text.length - 1])) {
        setState(() {
          math = code;
          controller.text =
              controller.text.substring(0, controller.text.length - 1) +
                  mathArray[code];
        });
      } else if (firstNumber != null && math != null) {
        secondNumber = controller.text.substring(firstNumber!.length + 1);
        double dFirstNumber = double.parse(firstNumber!);
        double dSecondNumber = double.parse(secondNumber!);
        double result = 0;
        switch (math) {
          case 0:
            result = dFirstNumber + dSecondNumber;
            break;
          case 1:
            result = dFirstNumber - dSecondNumber;
            break;
          case 2:
            result = dFirstNumber * dSecondNumber;
          case 3:
            result = dFirstNumber / dSecondNumber;
        }
        firstNumber = removeDotZero(result.toString());
        setState(() {
          math = code;
          controller.text = firstNumber! + mathArray[code];
        });
      } else {
        setState(() {
          math = code;
          firstNumber = controller.text;
          controller.text = controller.text + mathArray[code];
        });
      }
    }
  }

  void clickDot() {
    if (firstNumber == null && !controller.text.contains(".")) {
      setState(() {
        controller.text = "${controller.text}.";
      });

      return;
    }
    if (firstNumber != null &&
        math != null &&
        !mathArray.contains(controller.text[controller.text.length - 1])) {
      secondNumber = controller.text.substring(firstNumber!.length + 1);

      if (!secondNumber!.contains(".")) {
        controller.text = "${controller.text}.";
      }
    }
  }

  void clickEqual() {
    if (firstNumber == null) {
    } else {
      if (math == null) {
        //do nothing
      } else {
        if (mathArray.contains(controller.text[controller.text.length - 1])) {
          // miss second number
        } else {
          // calculate
          secondNumber = controller.text.substring(firstNumber!.length + 1);
          double dFirstNumber = double.parse(firstNumber!);
          double dSecondNumber = double.parse(secondNumber!);
          double result = 0;
          switch (math) {
            case 0:
              result = dFirstNumber + dSecondNumber;
              break;
            case 1:
              result = dFirstNumber - dSecondNumber;
              break;
            case 2:
              result = dFirstNumber * dSecondNumber;
            case 3:
              result = dFirstNumber / dSecondNumber;
          }
          firstNumber = removeDotZero(result.toString());
          setState(() {
            math = null;
            controller.text = firstNumber!;
          });
        }
      }
    }
  }

  String removeDotZero(String str) {
    if (str.length >= 3) {
      if (str.substring(str.length - 2, str.length) == ".0") {
        return str.substring(0, str.length - 2);
      } else {
        return str;
      }
    } else {
      return str;
    }
  }
}
