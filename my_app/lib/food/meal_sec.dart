import 'package:flutter/material.dart';
import 'package:my_app/Models/meal.dart';
import 'package:my_app/main_page/MainPage.dart';
import 'package:my_app/main_page/NavBar.dart';
import 'package:my_app/util/chatpage_meal.dart';
import 'package:vector_math/vector_math_64.dart' as math;


class meals_page extends StatelessWidget {

@override


  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 181, 57),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color.fromARGB(255, 241, 220, 127),
          title: Text("Meal",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w800,
              )),
          elevation: 0.0,
          actions: [IconButton(onPressed: () {

               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatPage_meal()),
                );

          }, icon: Icon(Icons.chat))],
        ),
        drawer: NavBar(),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              height: height * 0.36,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
                child: Container(
                  color:  Color.fromARGB(255, 241, 220, 127),
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 08,
                    bottom: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          "Today's Progress",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16.0,
                          top: 16.0,
                        ),
                        child: Row(
                          children: [
                            _RadialProgress(
                              width: width * 0.4,
                              height: width * 0.4,
                              progress: 0.7,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _IngredientProgress(
                                  ingredient: "Protien",
                                  progress: 0.3,
                                  progressColor:
                                      Color.fromARGB(255, 255, 157, 45),
                                  leftAmount: 72,
                                  width: width * 0.28,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                _IngredientProgress(
                                  ingredient: "Carbs",
                                  progress: 0.2,
                                  progressColor:
                                      Color.fromARGB(255, 129, 218, 111),
                                  leftAmount: 252,
                                  width: width * 0.28,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                _IngredientProgress(
                                  ingredient: "Fat",
                                  progress: 0.1,
                                  progressColor:
                                      Color.fromARGB(255, 101, 156, 203),
                                  leftAmount: 61,
                                  width: width * 0.28,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.37,
              left: 0,
              right: 0,
              child: Container(
                height: height * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 32,
                        bottom: 8,
                        right: 16,
                      ),

                      //Todays meal
                      child: Text(
                        "MESS MENU",
                        style: TextStyle(
                          color: Color.fromARGB(255, 87, 85, 85),
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),

                    //Scroll Menu
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                'TODAY',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            for (int i = 0; i < meals_today.length; i++)
                              mealCard(meal: meals_today[i]),
                            RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                'TOMMORROW',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            for (int i = 0; i < meals_tommorrow.length; i++)
                              mealCard(meal: meals_tommorrow[i]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          
             Positioned(
              top:height * 0.68 ,
              height: height * 0.36,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
                child: Container(
                  color: Color.fromARGB(255, 241, 220, 127),
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 08,
                    bottom: 20
                  ),
                  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    checkbox_b(), // Adjust the height according to your preference
    checkbox_l(),// Adjust the height according to your preference
    checkbox_d(),
  ],
)

                  
                  
             ),),),
          
          
          
          
          ],
        ),
      ),
    );
  }
}







class _IngredientProgress extends StatelessWidget {
  final String ingredient;
  final int leftAmount;
  final double progress, width;
  final Color progressColor;

  const _IngredientProgress(
      {super.key,
      required this.ingredient,
      required this.leftAmount,
      required this.progress,
      required this.progressColor,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ingredient.toUpperCase(),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  height: 10,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color.fromARGB(255, 220, 220, 220),
                  ),
                ),
                Container(
                  height: 10,
                  width: width * progress,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: progressColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Text('${leftAmount}g left'),
          ],
        ),
      ],
    );
  }
}

class _RadialProgress extends StatelessWidget {
  final double height, width, progress;

  const _RadialProgress({
    Key? key,
    required this.height,
    required this.width,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(progress: progress),
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                    text: "1731",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ]),
              ),
              Icon(
                Icons.whatshot,
                size: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RadialPainter extends CustomPainter {
  final double progress;

  _RadialPainter({super.repaint, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 10
      ..color = Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double relative_progress = 360 * progress;
    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90), math.radians(-relative_progress), false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}






class checkbox_b extends StatefulWidget {
  const checkbox_b({super.key});

  @override
  State<checkbox_b> createState() => _checkboxState();
}

class _checkboxState extends State<checkbox_b> {
  bool? _ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
         
        children: [
          SizedBox(height: 5,),
          Text("NUTRITION LOGGING", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
          ),),

         CheckboxListTile(
          dense: true, // Set dense to true to decrease the height of the checkbox
           contentPadding: EdgeInsets.zero,
          title: Text("BREAKFAST",
          style: TextStyle(
                fontSize: 16, // Adjusted font size
                fontWeight: FontWeight.w500,
              ),),
          value: _ischecked,
          onChanged: (bool? newvalue) {
            setState(() {
              _ischecked = newvalue;
            });
          },
          activeColor: Colors.orange,
          checkColor: Colors.white,
        ),

      ],
      ),
      
    );
  }
}


class checkbox_l extends StatefulWidget {
  const checkbox_l({super.key});

  @override
  State<checkbox_l> createState() => _checkboxState_l();
}

class _checkboxState_l extends State<checkbox_l> {
  bool? _ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
         
        children: [
         CheckboxListTile(
          dense: true, // Set dense to true to decrease the height of the checkbox
          contentPadding: EdgeInsets.zero,
          title: Text("LUNCH",
          style: TextStyle(
                fontSize: 16, // Adjusted font size
                fontWeight: FontWeight.w500,
              ),),
          value: _ischecked,
          onChanged: (bool? newvalue) {
            setState(() {
              _ischecked = newvalue;
            });
          },
          activeColor: Colors.orange,
          checkColor: Colors.white,
        ),

      ],
      ),
      
    );
  }
}

class checkbox_d extends StatefulWidget {
  const checkbox_d({super.key});

  @override
  State<checkbox_d> createState() => _checkboxState_d();
}

class _checkboxState_d extends State<checkbox_d> {
  bool? _ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
         
        children: [
         CheckboxListTile(
          dense: true, // Set dense to true to decrease the height of the checkbox
            contentPadding: EdgeInsets.zero,
          title: Text("DINNER",
          style: TextStyle(
                fontSize: 16, // Adjusted font size
                fontWeight: FontWeight.w500,
              ),),
          value: _ischecked,
          onChanged: (bool? newvalue) {
            setState(() {
              _ischecked = newvalue;
            });
          },
          activeColor: Colors.orange,
          checkColor: Colors.white,
        ),

      ],
      ),
      
    );
  }
}

