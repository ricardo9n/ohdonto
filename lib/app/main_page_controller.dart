import 'package:ohdonto/app/models/appointment.dart';
import 'package:ohdonto/app/models/appointment_time.dart';
import 'package:ohdonto/app/models/patient.dart';

class MainPageController {
  Future<List<Appointment>> loadAppointments() async {
    await Future.delayed(const Duration(seconds: 3));

    Appointment app1 = Appointment(
      patient: Patient('assets/images/profile.png', 'RR'),
      description: 'Canal dentário',
      appointmentTime: AppointmentTime(
        DateTime(2022, 3, 20, 8, 30),
        DateTime(2022, 3, 20, 9, 0),
      ),
      isConfirmed: true,
    );

    Appointment app2 = Appointment(
      patient: Patient('assets/images/profile.png', 'RR'),
      description: 'Canal dentário',
      appointmentTime: AppointmentTime(
        DateTime(2022, 3, 20, 10, 30),
        DateTime(2022, 3, 20, 11, 0),
      ),
      isConfirmed: false,
    );

    Appointment app3 = Appointment(
      patient: Patient('assets/images/profile.png', 'RR'),
      description: 'Obturação',
      appointmentTime: AppointmentTime(
        DateTime(2022, 3, 20, 11, 30),
        DateTime(2022, 3, 20, 12, 0),
      ),
      isConfirmed: false,
    );

    return [app1, app2, app3];
  }
}
