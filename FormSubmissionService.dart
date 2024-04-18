
import 'package:http/http.dart' as http;

class FormSubmissionService {
  final String endpointUrl;

  FormSubmissionService(this.endpointUrl);

  Future<bool> submitForm(Map<String, dynamic> formData) async {
    try {
      var response = await http.post(
        Uri.parse(endpointUrl),
        body: formData,
      );
      if (response.statusCode == 200) {
        // Handle successful submission
        return true;
      } else {
        // Handle failure
        return false;
      }
    } catch (e) {
      // Handle error in sending request
      print("Error submitting form: $e");
      return false;
    }
  }
}
