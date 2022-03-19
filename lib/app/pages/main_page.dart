import 'package:flutter/material.dart';
import 'package:ohdonto/app/models/appointment.dart';
import 'package:ohdonto/app/models/appointment_time.dart';
import 'package:ohdonto/app/models/patient.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPagePageState();
}

class _MainPagePageState extends State<MainPage> {
  late Appointment _appointment;

  @override
  void initState() {
    super.initState();

    _appointment = Appointment(
      patient: Patient('profile.png', 'RR'),
      description: 'Canal dentário',
      appointmentTime: AppointmentTime(
        DateTime(2022, 3, 20, 10, 30),
        DateTime(2022, 3, 20, 11, 0),
      ),
      isConfirmed: true,
    );
  }

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
                    _buildAppointment(_appointment)
                  ],
                ))));
  }

  Widget _buildAppointment(Appointment appointment) {
    return _buildPatientRequestList(appointment);
  }

  Widget _buildPatientRequestList(Appointment appointment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(appointment.patient.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        Text(appointment.description+"X"),
        Text(appointment.formatAppointmentTime()),
      ],
    );
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
