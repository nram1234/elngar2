import 'package:flutter/material.dart';

class Tap1 extends StatelessWidget {
  const Tap1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(


            decoration: InputDecoration(
              hintText: "الاسم",
              errorBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(

            decoration: InputDecoration(
              hintText: "رقم الموظف",
              errorBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(

            decoration: InputDecoration(
              hintText: "رقم الجوال",
              errorBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(

            decoration: InputDecoration(
              hintText: "كلمة السر",
              errorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
      ],
    );
  }
}
