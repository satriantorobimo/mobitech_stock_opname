import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_stock_opname/utility/string_router_util.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _pinPutController = TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 78,
    height: 78,
    textStyle: const TextStyle(
        fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.white),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imgs/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 48.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text('StockOpname .',
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 20,
                              color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                const Icon(
                  Icons.email_rounded,
                  color: Colors.white,
                  size: 48,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text('We Have Send Code Number To Your Email',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: GoogleFonts.raleway().fontFamily,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'ENTER YOUR OTP',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Pinput(
                    defaultPinTheme: defaultPinTheme,
                    controller: _pinPutController,
                    androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsUserConsentApi,
                    listenForMultipleSmsOnAndroid: true,
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    onCompleted: (String verificationCode) {
                      // debugPrint('onCompleted: $pin');
                    },
                    onChanged: (code) {
                      // debugPrint('onChanged: $value');
                    },
                    separator: const SizedBox(width: 16),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Haven`t receive email?',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                      Text(
                        'Send Email Again',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, StringRouterUtil.changePwdScreenRoute);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 66,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE45A04),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: const Center(
                        child: Text('Submit',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// 
