import 'package:flutter/material.dart';

class subcard extends StatelessWidget {
  final Name;
  final desc;
  final Rate;
  const subcard({super.key, this.Name, this.desc, this.Rate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
          child: Row(
            children: [
              Image.asset(
                'assets/Icons/Netflix.png',
                height: 50,
                width: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'GothamBold'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(desc,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'GothamMedium')),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      Rate,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontFamily: 'GothamBold'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
