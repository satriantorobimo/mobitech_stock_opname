import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownScreen extends StatefulWidget {
  const DropDownScreen({super.key, required this.title});
  final String title;

  @override
  State<DropDownScreen> createState() => _DropDownScreenState();
}

class _DropDownScreenState extends State<DropDownScreen> {
  List<String> location = [
    'BSD - Serpong Tangsel',
    'Alam Sutera - Tangerang',
    'Gading Serpong - Tangerang'
  ];

  List<String> condition = [
    'On Repair - External',
    'Replacement - External',
    'Sale - Internal'
  ];

  List<String> status = ['Available - Used'];

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
                Text(widget.title,
                    style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 20,
                        color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Material(
              elevation: 6,
              shadowColor: Colors.grey.withOpacity(0.4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(width: 1.0, color: Color(0xFFEAEAEA))),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                      hintText: 'Search',
                      contentPadding: const EdgeInsets.only(top: 32, left: 16),
                      hintStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: Colors.grey.withOpacity(0.5)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    child: Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey.withOpacity(0.6),
                    ),
                  );
                },
                itemCount: widget.title == 'Location'
                    ? location.length
                    : widget.title == 'Condition'
                        ? condition.length
                        : status.length,
                padding: const EdgeInsets.only(
                    left: 24.0, right: 24.0, bottom: 16, top: 16),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(
                          context,
                          widget.title == 'Location'
                              ? location[index]
                              : widget.title == 'Condition'
                                  ? condition[index]
                                  : status[index]);
                    },
                    child: Text(
                      widget.title == 'Location'
                          ? location[index]
                          : widget.title == 'Condition'
                              ? condition[index]
                              : status[index],
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  );
                }),
          ),
        ]));
  }
}
