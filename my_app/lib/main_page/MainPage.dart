import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/Models/meal.dart';
import 'package:my_app/main_page/NavBar.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'package:intl/intl.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final today = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 245, 160, 111),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: NavBar(),
      backgroundColor: Color.fromARGB(255, 213, 210, 210),
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
                color:   Color.fromARGB(255, 245, 160, 111),
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
                        "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM").format(today)}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        "Hey, Devrikh !!",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 35,
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
                                    Color.fromARGB(255, 168, 89, 247),
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
                                    Color.fromARGB(255, 97, 137, 248),
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
                                    Color.fromARGB(255, 126, 36, 6),
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
              height: height * 0.55,
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
                      "TODAY'S MESS MENU",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  //Scroll Menu
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(width: 30),
                          for (int i = 0; i < meals_today.length; i++)
                            mealCard(meal: meals_today[i]),
                        ],
                      ),
                    ),
                  ),

                  //quotes
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 28),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 245, 160, 111),
                            Color.fromARGB(255, 247, 85, 41),
                          ],
                        ),
                      ),
                      child: Align(
  alignment: Alignment.center,
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Text(
      '“Leading with empathy and understanding, I navigate the world with a sense of purpose and openness.”',
      style: TextStyle(
        color: Color.fromARGB(255, 241, 241, 241),
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
      textAlign: TextAlign.center,
    ),
  ),
)

                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class mealCard extends StatelessWidget {
  final Meal meal;

  const mealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(

    
      margin: const EdgeInsets.only(right: 20, bottom: 10),
      child: Material(
        
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 4,
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: ClipRRect(
                
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.network(
                  meal.imgPath,
                  width: 180,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      meal.mealTime,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text(
                      meal.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.whatshot,
                          size: 20,
                        ),
                        Text(
                          "${meal.calories} Calories",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
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

  const _RadialProgress(
      {super.key,
      required this.height,
      required this.width,
      required this.progress});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(progress: 0.7),
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                text: "1731",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 247, 85, 41),
                ),
              ),
              TextSpan(
                text: "\n",
              ),
              TextSpan(
                text: " kcal",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 247, 85, 41),
                ),
              ),
            ]),
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
      ..color = Color.fromARGB(255, 247, 85, 41)
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
