import 'package:flutter/material.dart';
import 'package:ohdonto/app/main_page_controller.dart';
import 'package:ohdonto/app/models/appointment.dart';
import 'package:ohdonto/app/pages/patient_request_widget.dart';
import 'package:ohdonto/signin_signup/domain/user_entity.dart';

class MainPage extends StatefulWidget {
  final UserEntity userEntity;
  const MainPage({Key? key, required this.userEntity}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPagePageState();
}

class _MainPagePageState extends State<MainPage> {
  //late Future<List<Appointment>> appointments;
  int ourCurrentIndex = 0;
  late MainPageController controller;

  @override
  void initState() {
    super.initState();
    controller = MainPageController();
  }

  /* @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFirsLine(),
                  _buildSecondLine(),
                  _buildAppointmentList(),
                ],
              ))),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.blue.shade300,
        selectedItemColor: Colors.blue.shade800,
        currentIndex: ourCurrentIndex,
        items: const [
          BottomNavigationBarItem(
              label: 'Calendário1', icon: Icon(Icons.calendar_month)),
          BottomNavigationBarItem(
              label: 'Pedidos', icon: Icon(Icons.description)),
          BottomNavigationBarItem(label: 'Chat', icon: Icon(Icons.chat)),
          BottomNavigationBarItem(
              label: 'Perfil', icon: Icon(Icons.supervised_user_circle)),
          BottomNavigationBarItem(
              label: 'Calendário', icon: Icon(Icons.calendar_month)),
        ],
        onTap: (index) {
          // print('Indice atual: $index');
          setState(() {
            ourCurrentIndex = index;
          });
          ourCurrentIndex = index;
        },
      ),
    );
  }

  Widget _buildAppointmentList() {
    return FutureBuilder<List<Appointment>>(
        future: controller.loadAppointments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          List<Appointment> appointmentList = snapshot.data!;

          List<Widget> widgetList = <Widget>[];

          for (int i = 0; i < appointmentList.length; i++) {
            widgetList
                .add(PatientRequestWidget(appointment: appointmentList[i]));
            if (i < appointmentList.length - 1) {
              widgetList.add(SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: const Divider(
                    height: 25,
                    color: Colors.grey,
                  )));
            }
          }
          return buildCard(widgetList);
        });
  }

  Widget buildCard(List<Widget> widgetList) {
    return Card(
        elevation: 5,
        child: Column(
          children: widgetList,
        ));
  }

  Widget _buildSecondLine() {
    return const Padding(
      padding: EdgeInsets.only(top: 22, bottom: 22), //todo bottom?
      child: Text("Patient Request",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
    );
  }

  Widget _buildFirsLine() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildGreetings(),
        _buildNotification(),
      ],
    );
  }

  Widget _buildGreetings() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Good Morning!', style: TextStyle(fontSize: 25)),
          Text('Dr. Adam',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ]);
  }

  Widget _buildNotification() {
    return Stack(children: [_buildNotificationIcon(), _buildCircle()]);
  }

  Widget _buildNotificationIcon() {
    return const Icon(
      Icons.notifications_none,
      color: Color(0xFF133ef6),
      size: 35,
    );
  }

  Widget _buildCircle() {
    return Positioned(
        left: 20,
        child: Container(
          width: 10,
          height: 10,
          decoration:
              const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
        ));
  }
}
