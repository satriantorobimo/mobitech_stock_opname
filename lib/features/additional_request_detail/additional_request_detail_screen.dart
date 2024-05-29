import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_stock_opname/features/navbar/navbar_provider.dart';
import 'package:mobile_stock_opname/utility/string_router_util.dart';
import 'package:provider/provider.dart';

class AdditionalRequestDetailScreen extends StatefulWidget {
  const AdditionalRequestDetailScreen({super.key});

  @override
  State<AdditionalRequestDetailScreen> createState() =>
      _AdditionalRequestDetailScreenState();
}

class _AdditionalRequestDetailScreenState
    extends State<AdditionalRequestDetailScreen> {
  TextEditingController _assetCodeCtrl = TextEditingController();
  TextEditingController _purchaseDateCtrl = TextEditingController();
  TextEditingController _vendorCtrl = TextEditingController();
  TextEditingController _picCtrl = TextEditingController();
  TextEditingController _warrantyCtrl = TextEditingController();
  TextEditingController _merchantRoutineCtrl = TextEditingController();
  TextEditingController _assetLocationCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF130139),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              Text('Additional Request',
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 20,
                      color: Colors.white)),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shrinkWrap: true,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.qr_code_2_rounded,
                  size: 150,
                  color: Colors.white,
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  '0011.AS.2401.00004',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Asset',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _assetCodeCtrl,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(bottom: 16),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE6E7E8)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE6E7E8)),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Purchase Date',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _purchaseDateCtrl,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(bottom: 16),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE6E7E8)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE6E7E8)),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Vendor',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _vendorCtrl,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(bottom: 16),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE6E7E8)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE6E7E8)),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'PIC',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _picCtrl,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(bottom: 16),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE6E7E8)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE6E7E8)),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Warranty',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _warrantyCtrl,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(bottom: 16),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE6E7E8)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE6E7E8)),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Maintanance Routine',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _merchantRoutineCtrl,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(bottom: 16),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE6E7E8)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE6E7E8)),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Asset Location',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Stack(
                children: [
                  TextFormField(
                    controller: _assetLocationCtrl,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.only(bottom: 16),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE6E7E8)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE6E7E8)),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 0,
                    bottom: 8,
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/imgs/map.png',
                        width: 40,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  var bottomBarProvider =
                      Provider.of<NavbarProvider>(context, listen: false);
                  bottomBarProvider.setPage(1);
                  bottomBarProvider.setTab(1);
                  Navigator.pushNamedAndRemoveUntil(context,
                      StringRouterUtil.navbarScreenRoute, (route) => false);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 66,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xFF5DE0E6), Color(0xFF004AAD)],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
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
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
