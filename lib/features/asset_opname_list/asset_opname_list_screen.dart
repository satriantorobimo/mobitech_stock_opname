import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_stock_opname/utility/string_router_util.dart';

class AssetOpnameListScreen extends StatelessWidget {
  const AssetOpnameListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF130139),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.06,
                left: 16.0,
                right: 16.0),
            child: Text('Asset Opname List',
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 20,
                    color: Colors.white)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 65,
                  width: 65,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.person_2_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('Naomi',
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Asset Management Staff',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white)),
                        Text('Head Office',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.check_circle_rounded,
                              color: Colors.green,
                              size: 12,
                            ),
                            const SizedBox(width: 4),
                            Text('Active',
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 24.0, right: 24.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 55,
                          width: 55,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          alignment: Alignment.center,
                          child: Text('70%',
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white)),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 115,
                                  child: Text('Opname No',
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.white)),
                                ),
                                Text(': 012.05.2024',
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 12,
                                        color: Colors.white)),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 115,
                                  child: Text('Periode Opname',
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontSize: 12,
                                          color: Colors.white)),
                                ),
                                Text(': 12 to 26 May 2024',
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 12,
                                        color: Colors.white)),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 115,
                                  child: Text('Total Asset Opname',
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontSize: 12,
                                          color: Colors.white)),
                                ),
                                Text(': 300',
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 12,
                                        color: Colors.white)),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 115,
                                  child: Text('Company',
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontSize: 12,
                                          color: Colors.white)),
                                ),
                                Text(': PT ABC',
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 12,
                                        color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context,
                                StringRouterUtil.dashboardDetailScreenRoute);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xFF3B3B3B),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            padding: EdgeInsets.all(5),
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(context,
                            //     StringRouterUtil.addRequestScreenRoute);
                          },
                          child: Center(
                            child: Icon(
                              Icons.add_circle_rounded,
                              color: Color(0xFF00669B),
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 40),
                  child: Container(
                    width: double.infinity,
                    height: 1.5,
                    color: Color(0xFFFF7122),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 55,
                          width: 55,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          alignment: Alignment.center,
                          child: Text('20%',
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white)),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 115,
                                  child: Text('Opname No',
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.white)),
                                ),
                                Text(': 012.05.2024',
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 12,
                                        color: Colors.white)),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 115,
                                  child: Text('Periode Opname',
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontSize: 12,
                                          color: Colors.white)),
                                ),
                                Text(': 12 to 26 May 2024',
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 12,
                                        color: Colors.white)),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 115,
                                  child: Text('Total Asset Opname',
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontSize: 12,
                                          color: Colors.white)),
                                ),
                                Text(': 300',
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 12,
                                        color: Colors.white)),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 115,
                                  child: Text('Company',
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontSize: 12,
                                          color: Colors.white)),
                                ),
                                Text(': PT DEF',
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 12,
                                        color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context,
                                StringRouterUtil.dashboardDetailScreenRoute);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xFF3B3B3B),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            padding: EdgeInsets.all(5),
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context,
                                StringRouterUtil.assetOpnameScreenRoute);
                          },
                          child: Center(
                            child: Icon(
                              Icons.add_circle_rounded,
                              color: Color(0xFF00669B),
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
