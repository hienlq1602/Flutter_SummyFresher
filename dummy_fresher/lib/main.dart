import 'package:dummy_fresher/ScoreData.dart';
import 'package:dummy_fresher/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'model/counter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/paint_scr.dart';

// void main() {
//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider(create: (_) => GioiTinh()),
//       ChangeNotifierProvider(create: (_) => BangCap()),
//
//     ],
//       child: MaterialApp(home: GetX_Cus()),
//   ));
// }
void main() {
  runApp(MaterialApp(home: animatedPositioned()));
}

class Cus_Scaffold extends StatelessWidget {
  const Cus_Scaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold Demo'),
        foregroundColor: Colors.deepPurple,
        backgroundColor: Colors.blue,
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.face_2)),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Icon(Icons.face_2)),
          ),
        ],
      ),
      drawer: Drawer(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK')),
      ),
      endDrawer: Drawer(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel')),
      ),
      body: Container(child: Center(child: Text('Hellooo'))),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.share), onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 500,
        ),
      ),
    );
  }
}

//Ưu tiên sử dụng RadioListTile
class Cus_RadioButton extends StatefulWidget {
  const Cus_RadioButton({super.key});

  @override
  State<Cus_RadioButton> createState() => _Cus_RadioButtonState();
}

class _Cus_RadioButtonState extends State<Cus_RadioButton> {
  int _gioiTinh = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Button'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioListTile(
              value: 2,
              groupValue: _gioiTinh,
              onChanged: (onChanged) {
                setState(() {
                  _gioiTinh = 2;
                });
              },
              title: Text('Gay'),
              subtitle: Text('Gay'),
              secondary: Icon(Icons.male),
              tileColor: Colors.green,
              contentPadding: EdgeInsets.all(50),
              activeColor: Colors.amber,
              shape: Border.all(width: 10, color: Colors.red)),
          ListTile(
            title: Text('Male'),
            subtitle: Text('data'),
            trailing: Icon(Icons.male),
            leading: Radio(
                value: 0,
                groupValue: _gioiTinh,
                onChanged: (newValue) {
                  setState(() {
                    _gioiTinh = 0;
                  });
                }),
          ),
          ListTile(
            title: Text('Female'),
            leading: Radio(
                value: 1,
                groupValue: _gioiTinh,
                onChanged: (newValue) {
                  setState(() {
                    _gioiTinh = 1;
                  });
                }),
          )
        ],
      ),
    );
  }
}

class Cus_GridView extends StatelessWidget {
  const Cus_GridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      //gridDelegate -> cung cap phong cach hien thi cua gridView
      //crossAxisCount -> So phan tu theo chieu ngang vuong goc voi truc chinh thang dung
      // body: GridView(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 3,
      //     mainAxisSpacing: 10,
      //     crossAxisSpacing: 10,
      //     // mainAxisExtent: 250,
      //   ),
      //   scrollDirection: Axis.horizontal,
      //   physics: BouncingScrollPhysics(),
      //   shrinkWrap: true ,
      //   children: [
      //     Container(
      //       color: Colors.red),
      //     Container(
      //       color: Colors.green),
      //     Container(
      //       color: Colors.black),
      //     Container(
      //       color: Colors.orange),
      //     // for( var i =0; i<10; i++) Image.network('https://picsum.photos/id/$i/400')
      //   ],
      // ),
      body: GridView.count(crossAxisCount: 3, children: [
        for (var i = 0; i < 50; i++)
          Image.network('https://picsum.photos/id/$i/400')
      ]),
    );
  }
}

class Cus_SnackBar extends StatelessWidget {
  const Cus_SnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello world'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.access_alarm),
          onPressed: () {
            var mySnackBar = SnackBar(
                content: Text('Wooooooooooo'),
                duration: Duration(milliseconds: 10),
                backgroundColor: Colors.red);
            ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
          }),
    );
  }
}

// Quản lý trạng thái trong flutter
//Provider
class CounterProvider extends ChangeNotifier {
  int _counter = 100;

  int get counter => _counter;

  void add() {
    _counter++;
    notifyListeners();
  }
}

class CounterHome extends StatelessWidget {
  const CounterHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.watch<CounterProvider>().counter.toString(),
            style: TextStyle(fontSize: 50),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => SecondScreen()));
            },
            child: Text('Go to second Screen',
                style: TextStyle(color: Colors.red)),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            context.read<CounterProvider>().add();
          }),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.watch<CounterProvider>().counter.toString(),
            style: TextStyle(fontSize: 50),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Go to second Screen',
                style: TextStyle(color: Colors.red)),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            context.read<CounterProvider>().add();
          }),
    );
  }
}

//Quản lý state bằng provider với Consumer
class MySetting extends ChangeNotifier {
  String text = 'Done';
  Color colorr = Colors.red;

  void changeText() {
    if (text == 'Hello')
      text = 'World';
    else {
      text = 'Hello';
    }
    notifyListeners();
  }

  void changeColor() {
    if (colorr == Colors.red)
      colorr = Colors.green;
    else {
      colorr = Colors.red;
    }
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MySetting>(builder: (context, mySettings, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Provider Demo'),
          backgroundColor: mySettings.colorr,
        ),
        drawer: Drawer(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    mySettings.changeText();
                    Navigator.pop(context);
                  },
                  child: Text('Change Text')),
              ElevatedButton(
                  onPressed: () {
                    mySettings.changeColor();
                    Navigator.pop(context);
                  },
                  child: Text('Change Color')),
            ],
          ),
        )),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    mySettings.changeText();
                  },
                  child: Text('Change Text')),
              Text('${mySettings.text}')
            ],
          ),
        ),
      );
    });
  }
}

// Quản lý sate bằng provider với MultiProvider
// Đổi màu đen - trắng của giao diện
// class MyApp2 extends StatelessWidget {
//   const MyApp2({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Calculator',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         brightness: context.watch<MySetting2>().isDark
//             ? Brightness.dark
//             : Brightness.light,
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage2(),
//     );
//   }
// }
// class MyHomePage2 extends StatelessWidget {
//   const MyHomePage2({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Provider'),
//         actions: [
//           Switch(
//               value: context.watch<MySetting2>().isDark,
//               onChanged: (newValue) {
//                 Provider.of<MySetting2>(context, listen: false)
//                     .setBrightness(newValue);
//               })
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('You have pushed the button this many times :'),
//             Text(
//               context.watch<Counter>().myValue.toString(),
//               style: Theme.of(context).textTheme.headlineMedium,
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add),
//           onPressed: () {
//             context.read<Counter>().add();
//           }),
//     );
//   }
// }

//MultiProvidẻ + Consumer2/3/4/5/6
enum gioi_tinh { nam, nu }

enum bang_cap { CaoDang, DaiHoc, Thac, Si }

class GioiTinh extends ChangeNotifier {
  gioi_tinh _gioiTinh = gioi_tinh.nam;

  gioi_tinh get gioiTinh => _gioiTinh;

  set gioiTinh(gioi_tinh value) {
    _gioiTinh = value;
    notifyListeners();
  }
}

class BangCap extends ChangeNotifier {
  bang_cap _bangCap = bang_cap.CaoDang;

  bang_cap get bangCap => _bangCap;

  set gioiTinh(bang_cap value) {
    _bangCap = value;
    notifyListeners();
  }
}

class MyApp3 extends StatelessWidget {
  const MyApp3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Radio Demo'),
          backgroundColor: Colors.blue,
        ),
        body: Consumer2<GioiTinh, BangCap>(
            builder: (context, inforGioiTinh, inforBangCap, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Gioi Tinh'),
              RadioListTile<gioi_tinh>(
                  value: gioi_tinh.nam,
                  title: Text('nam'),
                  groupValue: inforGioiTinh.gioiTinh,
                  onChanged: (value) {
                    inforGioiTinh.gioiTinh = value!;
                  }),
              RadioListTile<gioi_tinh>(
                  value: gioi_tinh.nu,
                  title: Text('nu'),
                  groupValue: inforGioiTinh.gioiTinh,
                  onChanged: (value) {
                    inforGioiTinh.gioiTinh = value!;
                  }),
              Text('Bang Cap'),
              Divider(height: 100),
              Center(
                  child: Text('Thong tin ca nhan: ${inforGioiTinh.gioiTinh}')),
            ],
          );
        }));
  }
}

//GetX trong StatManager
class Counter extends GetxController {
  RxInt count = 0.obs;

  void add() {
    count++;
  }
}

class Cus_getX extends StatelessWidget {
  final counter = Get.put(Counter());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Provider')),
      body: Center(
        child: Column(
          children: [
            Obx(() => Text('${counter.count}', style: TextStyle(fontSize: 50))),
            ElevatedButton(
                onPressed: () {
                  Get.to(OtherScreen());
                },
                child: Text('Go to other screen')),
            ElevatedButton(
                onPressed: () {
                  Get.to(ThirdScreen());
                },
                child: Text('Go to Third screen')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            counter.add();
          }),
    );
  }
}

class OtherScreen extends StatelessWidget {
  final Counter otherCounter = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Other Screen'), backgroundColor: Colors.blue),
      body: Center(
        child: Obx(() => Text(
              '${otherCounter.count}',
              style: TextStyle(fontSize: 50),
            )),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            otherCounter.add();
          }),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.snackbar('Hi', 'Bla bla',
                    snackPosition: SnackPosition.BOTTOM);
              },
              child: Text('show snack bar')),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Back')),
        ],
      ),
    );
  }
}

//Lưu trữ giá trị số nguyên
class sharePreference1 extends StatefulWidget {
  const sharePreference1({super.key});

  @override
  State<sharePreference1> createState() => _sharePreference1State();
}

class _sharePreference1State extends State<sharePreference1> {
  late int _score;

  @override
  void initState() {
    super.initState();
    _loadScore();
  }

  void _loadScore() async {
    final scoreData = await SharedPreferences.getInstance();
    setState(() {
      _score = scoreData.getInt('score') ?? 0;
    });
  }

  void _incrementCounter() async {
    final scoreData = await SharedPreferences.getInstance();
    setState(() {
      _score = (scoreData.getInt('score') ?? 0) + 1;
      scoreData.setInt('score', _score);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Preference 1 with int'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_score', style: TextStyle(fontSize: 50)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _incrementCounter();
          },
          child: Icon(Icons.add)),
    );
  }
}

//Lưu trữ dữ liệu với path_provider
class pathPriver extends StatefulWidget {
  const pathPriver({super.key});

  @override
  State<pathPriver> createState() => _pathPriverState();
}

class _pathPriverState extends State<pathPriver> {
  int _score = 0;

  @override
  void initState() {
    super.initState();
    ScoreData.readScore().then((value) {
      setState(() {
        _score = int.parse(value);
      });
    });
  }

  // void _loadScore() async{
  //   final scoreData = await SharedPreferences.getInstance();
  //   setState(() {
  //     _score = scoreData.getInt('score') ?? 0;
  //   });
  // }
  void _incrementCounter() async {
    setState(() {
      _score++;
      ScoreData.saveScore(_score.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('path provider'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_score', style: TextStyle(fontSize: 50)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _incrementCounter();
          },
          child: Icon(Icons.add)),
    );
  }
}

//Widget CustomPaint && CustomPainter
class MyPaintApp extends StatelessWidget {
  const MyPaintApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaintScreen(),
    );
  }
}

//Animation - AnimatedContainer Widget
class animatedContainer extends StatelessWidget {
  const animatedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAnimatedContainerPage(),
    );
  }
}

class MyAnimatedContainerPage extends StatefulWidget {
  const MyAnimatedContainerPage({super.key});

  @override
  State<MyAnimatedContainerPage> createState() =>
      _MyAnimatedContainerPageState();
}

class _MyAnimatedContainerPageState extends State<MyAnimatedContainerPage> {
  double _width = 50;
  double _height = 50;

  // Colors _color = Colors.red as Colors;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   color: Colors.red,
        //   width: _width,
        //   height: _height,
        // ),
        SizedBox(height: 50),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _width = _width == 50 ? 200 : 50;
                _height = _height == 50 ? 200 : 50;
              });
            },
            child: Text('Change size')),

        SizedBox(height: 50),
        // ElevatedButton(onPressed: (){
        //   setState(() {
        //     if (_color == Colors.red) {
        //       _color = Colors.green as Colors;
        //     } else {
        //       _color = Colors.red as Colors;
        //     }
        //   });
        // },
        //     child: Text('Change size')),
        AnimatedContainer(
          duration: Duration(milliseconds: 400),
          curve: Curves.slowMiddle,
          color: Colors.blue,
          width: _width,
          height: _height,
        )
      ],
    );
  }
}

//Animation - AnimatedPositioned Widget
class animatedPositioned extends StatelessWidget {
  const animatedPositioned({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageForAnimatedPosition(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePageForAnimatedPosition extends StatefulWidget {
  const HomePageForAnimatedPosition({super.key});

  @override
  State<HomePageForAnimatedPosition> createState() =>
      _HomePageForAnimatedPositionState();
}

class _HomePageForAnimatedPositionState
    extends State<HomePageForAnimatedPosition> {
  double _top = 0.0;
  double _left = 0.0;
  double _width = 400;
  double _height = 400;
  double _widthOfPoint =40;
  double _heightOfPoint =40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.yellow,
            width: _width,
            height: _height,
            child: Stack(
              children: [
                AnimatedPositioned(
                  child: Container(color: Colors.green),
                  duration: Duration(milliseconds: 100),
                  top: 40,
                  left: 40,
                  height: 40,
                  width: 40,
                  curve: Curves.easeOutBack,
                ),
                AnimatedPositioned(
                    child: Container(color: Colors.red),
                    top: _top,
                    left: _left,
                    width: _widthOfPoint,
                    height: _heightOfPoint,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.bounceOut),

              ],
            ),
          ),
          SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_top != 0) {
                        _top -= 40;
                      }
                    });
                  },
                  child: Text('Up')),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (_left != 0) {
                            _left -= 40;
                          }
                          if(_top==40){
                            _widthOfPoint+=40;
                          }
                        });
                      },
                      child: Text('Left')),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (_left != _width - 40) {
                            _left += 40;
                          }
                        });
                      },
                      child: Text('Right')),
                ],
              ),
              SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_top != _height - 40) {
                        _top += 40;
                      }
                    });
                  },
                  child: Text('Down')),
              SizedBox(width: 10),
              SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}
