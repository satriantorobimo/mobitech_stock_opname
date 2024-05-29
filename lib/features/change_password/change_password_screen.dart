import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_stock_opname/utility/string_router_util.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _showPwd1 = true;
  bool _showPwd2 = true;
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
                              fontSize: 29,
                              color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.37,
                      child: Text('Change Password',
                          style: TextStyle(
                              fontFamily: GoogleFonts.nunito().fontFamily,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'PASSWORD : ',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Stack(
                        children: [
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
                              obscureText: _showPwd1,
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
                          Positioned(
                            right: 16,
                            top: 0,
                            bottom: 0,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showPwd1 = !_showPwd1;
                                });
                              },
                              child: Icon(
                                _showPwd1
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.black38,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'CONFIRM PASSWORD :',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Stack(
                        children: [
                          Material(
                            elevation: 6,
                            shadowColor: Colors.grey.withOpacity(0.4),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                                side: const BorderSide(
                                    width: 1.0, color: Color(0xFFB1ADBC))),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              obscureText: _showPwd2,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.all(24),
                                  hintStyle: TextStyle(
                                      color: Colors.grey.withOpacity(0.5)),
                                  filled: true,
                                  fillColor: const Color(0xFFB1ADBC),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide.none,
                                  )),
                            ),
                          ),
                          Positioned(
                            right: 16,
                            top: 0,
                            bottom: 0,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showPwd2 = !_showPwd2;
                                });
                              },
                              child: Icon(
                                _showPwd2
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.black38,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(context,
                        StringRouterUtil.navbarScreenRoute, (route) => false);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 66,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE45A04),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Confirm',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
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
