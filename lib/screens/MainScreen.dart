
import 'package:flutter/material.dart';
import 'package:hawaiidrainpros/utils/colors.dart';
import 'package:hawaiidrainpros/utils/styles.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double mJobHoursResult = 0;
  double mTotalJobPriceResult = 0;
  double mPartsCostResult = 0;
  double mApprenticeResult = 0;
  double mSubcontractorResult = 0;
  double mSalesManagerResult = 0;
  double mJobPriceSoldBySalesManagerResult = 0;

  Widget outputText(double result, Size size) {
    return Container(
      padding: EdgeInsets.only(right: 10, left: 10),
      height: 35,
      width: size.width / 3,
      decoration: loginsignupEtStyle,
      child: Text(
        result.toString(),
        style: lablesStyle,
      ),
    );
  }

  Widget textInputField(String hint, TextInputType inputType,
      TextInputAction inputAction, Size size) {
    return Container(
      padding: EdgeInsets.only(right: 10, left: 10),
      height: 35,
      width: size.width / 4,
      decoration: loginsignupEtStyle,
      child: Center(
        child: TextField(
          style: loginsignEtHintStyle,
          textAlign: TextAlign.left,
          textInputAction: inputAction,
          maxLines: 1,
          keyboardType: inputType,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
              hintStyle: loginsignEtHintStyle,
              fillColor: bggray),
          onChanged: (text) {
            switch (hint) {
              case 'Enter Job Hours':
                print('on Job Hours changes:$text');

                if (text.length == 0) {
                  setState(() {
                    mJobHoursResult = 0;
                  });
                } else {
                  var value = double.parse(text);
                  setState(() {
                    mJobHoursResult = value * 10;
                    mTotalJobPriceResult = mJobHoursResult +
                        mPartsCostResult +
                        mApprenticeResult +
                        mSubcontractorResult;
                  });
                }

                break;

              case 'Enter parts costs':
                print('on Enter parts costs changes:$text');
                if (text.length == 0) {
                  setState(() {
                    mPartsCostResult = 0;
                  });
                } else {
                  var value = double.parse(text);
                  setState(() {
                    mPartsCostResult = value * (1 + 12);
                    mTotalJobPriceResult = mJobHoursResult +
                        mPartsCostResult +
                        mApprenticeResult +
                        mSubcontractorResult;
                  });
                }
                break;

              case 'Enter Apprentice':
                print('on Enter Apprentice changes:$text');
                if (text.length == 0) {
                  setState(() {
                    mApprenticeResult = 0;
                  });
                } else {
                  var value = double.parse(text);
                  setState(() {
                    mApprenticeResult = value * 14;
                    mTotalJobPriceResult = mJobHoursResult +
                        mPartsCostResult +
                        mApprenticeResult +
                        mSubcontractorResult;
                  });
                }
                break;

              case 'Enter Subcontractor':
                print('on Enter Subcontractor changes:$text');
                if (text.length == 0) {
                  setState(() {
                    mSubcontractorResult = 0;
                  });
                } else {
                  var value = double.parse(text);
                  setState(() {
                    mSubcontractorResult = value * (1 + 16);
                    mTotalJobPriceResult = mJobHoursResult +
                        mPartsCostResult +
                        mApprenticeResult +
                        mSubcontractorResult;
                  });
                }
                break;

              case 'Enter Sales Manager cost':
                print('on  Enter Sales Manager cost changes:$text');
                if (text.length == 0) {
                  setState(() {
                    mSalesManagerResult = 0;
                  });
                } else {
                  var value = double.parse(text);
                  setState(() {
                    mSalesManagerResult = value;
                    mJobPriceSoldBySalesManagerResult = mTotalJobPriceResult*(1+mSalesManagerResult);
                  });
                }
                break;

              default:
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Image.asset(
                  'assets/logo.PNG',
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Custom Job Builder",
                  style: bigTextStyle,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Row(
                    children: [
                      LableText(lable: "Job Hours"),
                      SizedBox(
                        width: 10,
                      ),
                      textInputField('Enter Job Hours', TextInputType.number,
                          TextInputAction.next, MediaQuery.of(context).size),
                      SizedBox(
                        width: 10,
                      ),
                      outputText(mJobHoursResult, MediaQuery.of(context).size)
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Row(
                    children: [
                      LableText(lable: "Parts Cost"),
                      SizedBox(
                        width: 10,
                      ),
                      textInputField('Enter parts costs', TextInputType.number,
                          TextInputAction.next, MediaQuery.of(context).size),
                      SizedBox(
                        width: 10,
                      ),
                      outputText(mPartsCostResult, MediaQuery.of(context).size)
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      LableText(lable: "Apprentice Hours"),
                      SizedBox(
                        width: 10,
                      ),
                      textInputField('Enter Apprentice', TextInputType.number,
                          TextInputAction.next, MediaQuery.of(context).size),
                      SizedBox(
                        width: 10,
                      ),
                      outputText(mApprenticeResult, MediaQuery.of(context).size)
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      LableText(lable: "Subcontractor Cost"),
                      SizedBox(
                        width: 10,
                      ),
                      textInputField(
                          'Enter Subcontractor',
                          TextInputType.number,
                          TextInputAction.next,
                          MediaQuery.of(context).size),
                      SizedBox(
                        width: 10,
                      ),
                      outputText(
                          mSubcontractorResult, MediaQuery.of(context).size)
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                      ),
                      LableText(lable: "Job Price"),
                      SizedBox(
                        width: 10,
                      ),
                      outputText(
                          mTotalJobPriceResult, MediaQuery.of(context).size)
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      LableText(lable: "Sales manager cost"),
                      SizedBox(
                        width: 10,
                      ),
                      textInputField(
                          'Enter Sales Manager cost',
                          TextInputType.number,
                          TextInputAction.done,
                          MediaQuery.of(context).size),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        child: Text(
                          'Job price sold by Sales manager',
                          style: lablesStyle,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      outputText(mJobPriceSoldBySalesManagerResult,
                          MediaQuery.of(context).size)
                    ],
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}

class LableText extends StatelessWidget {
  const LableText({
    Key key,
    this.lable,
  }) : super(key: key);

  final String lable;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 4,
      child: Text(
        lable,
        style: lablesStyle,
      ),
    );
  }
}
