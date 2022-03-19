import 'package:ohdonto/app/models/appointment_time.dart';
import 'package:ohdonto/app/models/patient.dart';

class Appointment {
  final Patient patient;
  final String description;
  final AppointmentTime appointmentTime;
  final bool isConfirmed;

  Appointment({
    required this.patient,
    required this.description,
    required this.appointmentTime,
    required this.isConfirmed,
  });

  String formatAppointmentTime() {
    return appointmentTime.initTimeEndTime;
  }
}