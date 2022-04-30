import 'package:flutter/material.dart';
import 'package:ohdonto/app/models/appointment.dart';

class PatientRequestWidget extends StatelessWidget {
  final Appointment appointment;

  const PatientRequestWidget({Key? key, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildConfirmed(appointment),
          const SizedBox(
            width: 12,
          ),
          _buildProfilePicture(appointment),
          const SizedBox(
            width: 12,
          ),
          Expanded(child: _buildPatientRequestList(appointment)),
          _buildCircledArrow(),
        ],
      ),
    );
  }

  Widget _buildConfirmed(Appointment appointment) {
    return Container(
        width: 5,
        height: 50,
        color: appointment.isConfirmed ? Colors.green : Colors.red);
  }

  Widget _buildProfilePicture(Appointment appointment) {
    final String profile = appointment.patient.profilePicturePath;
    return CircleAvatar(
      radius: 20,
      backgroundImage: AssetImage(profile),
    );
  }

  Widget _buildPatientRequestList(Appointment appointment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appointment.patient.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(appointment.description),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(appointment.formatAppointmentTime()),
        ),
      ],
    );
  }

  Widget _buildCircledArrow() {
    return Container(
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.arrow_forward_ios_outlined,
          size: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}
