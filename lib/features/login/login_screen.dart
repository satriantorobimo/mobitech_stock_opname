import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_stock_opname/utility/string_router_util.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/imgs/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Column(
                  children: [
                    Text('StockOpname .',
                        style: TextStyle(
                            fontFamily: GoogleFonts.leagueSpartan().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                            color: Colors.white)),
                    const SizedBox(height: 16),
                    Text(
                      'M o b i l e',
                      style: TextStyle(
                          fontFamily: GoogleFonts.quicksand().fontFamily,
                          fontSize: 13,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'USERNAME',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Material(
                      elevation: 6,
                      shadowColor: Colors.grey.withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(
                              width: 1.0, color: Color(0xFFB1ADBC))),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.all(24),
                            filled: true,
                            fillColor: const Color(0xFFB1ADBC),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'PASSWORD',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Material(
                      elevation: 6,
                      shadowColor: Colors.grey.withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(
                              width: 1.0, color: Color(0xFFB1ADBC))),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.all(24),
                            hintStyle:
                                TextStyle(color: Colors.grey.withOpacity(0.5)),
                            filled: true,
                            fillColor: const Color(0xFFB1ADBC),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context,
                            StringRouterUtil.navbarScreenRoute,
                            (route) => false);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 66,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white, width: 2)),
                        child: Center(
                            child: Text('Login',
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, StringRouterUtil.otpScreenRoute);
                      },
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    'P o w e r e d  b y ',
                    style: TextStyle(
                        fontFamily: GoogleFonts.quicksand().fontFamily,
                        fontSize: 11,
                        color: Colors.white),
                  ),
                  Image.asset(
                    'assets/imgs/logo.png',
                    width: 250,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
