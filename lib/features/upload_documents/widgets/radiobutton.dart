import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class RadioBUtton extends StatefulWidget {
  const RadioBUtton({super.key});

  @override
  State<RadioBUtton> createState() => _RadioBUttonState();
}

class _RadioBUttonState extends State<RadioBUtton> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6, left: 10, top: 6),
          child: Text(
            "Gender",
            style: GoogleFonts.lato(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 2, 51, 92),
            ),
          ),
        ),
        RadioListTile(
          activeColor: Color.fromARGB(255, 2, 51, 92),
          title: Text(
            'Male',
            style: GoogleFonts.lato(fontSize: 16),
          ),
          value: 1,
          groupValue: _value,
          onChanged: (value) {
            setState(() {
              _value = value!;
            });
          },
        ),
        RadioListTile(
          activeColor: Color.fromARGB(255, 2, 51, 92),
          title: Text(
            'Female',
            style: GoogleFonts.lato(fontSize: 16),
          ),
          value: 2,
          groupValue: _value,
          onChanged: (value) {
            setState(() {
              _value = value!;
            });
          },
        ),
        RadioListTile(
          activeColor: Color.fromARGB(255, 2, 51, 92),
          title: Text(
            'Others',
            style: GoogleFonts.lato(fontSize: 16),
          ),
          value: 3,
          groupValue: _value,
          onChanged: (value) {
            setState(() {
              _value = value!;
            });
          },
        ),
      ],
    );
  }
}
