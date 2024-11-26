

import 'response_model.dart';

class ResponseError{
    static ResponseData defaultError() {
    return ResponseData(
      statusCode: 500,
      message: "Something went wrong. Please try again in a moment.",
    );
  }
}