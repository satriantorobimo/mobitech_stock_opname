import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_stock_opname/utility/string_router_util.dart';

class DashboardDetailScreen extends StatelessWidget {
  const DashboardDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, StringRouterUtil.assetOpnameScreenRoute);
        },
      ),
      backgroundColor: const Color(0xFF130139),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.06,
                left: 16.0,
                right: 16.0),
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
                Text('Asset Opname',
                    style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 20,
                        color: Colors.white)),
              ],
            ),
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
            padding: const EdgeInsets.only(top: 32.0, left: 24.0, right: 24.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xFF122E69),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dashboard - 02 May 2024',
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: const Color(0xFF00B7FF))),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: Color(0xFFEEEEEE).withOpacity(0.5),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 50,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 24,
                      ),
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
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 32),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Today ',
                    style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white)),
                Text('10/10',
                    style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 14,
                        color: Color(0xFFBFBFBF))),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(top: 18, bottom: 18),
                  child: Container(
                    width: double.infinity,
                    height: 1.5,
                    color: Color(0xFFFF7122),
                  ),
                );
              },
              itemCount: 10,
              padding: const EdgeInsets.only(
                  left: 24.0, right: 24.0, bottom: 80, top: 16),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                                color: Color(0xFF3B3B3B),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: (index % 2 == 0)
                                ? Icon(
                                    Icons.task,
                                    color: Colors.white38,
                                    size: 34,
                                  )
                                : SvgPicture.asset(
                                    'assets/icons/file.svg',
                                    color: Colors.white38,
                                    height: 34,
                                    width: 34,
                                  )),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Asset Code - Asset Name',
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontSize: 15,
                                    color: Colors.white)),
                            Text('Location : Jagakarsa',
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontSize: 13,
                                    color: Color(0xFFBFBFBF))),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context,
                            StringRouterUtil.assetOpnameDetailScreenRoute,
                            arguments: (index % 2 == 0) ? true : false);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFF3B3B3B),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
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
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
