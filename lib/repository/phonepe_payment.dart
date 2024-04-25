import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:phonepay_payment_gateway_flutter/app_util/log_functions/log_functions.dart';
import 'package:phonepay_payment_gateway_flutter/main.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
import 'package:crypto/crypto.dart';

class PhonepePayment {
  String _checkSum = "";
  final String _saltKey = "099eb0cd-02cf-4e2a-8aca-3e6c6aff0399";
  final String _saltIndex = "1";
  final String _apiEndPoint = "/pg/v1/pay";
  String _body = "";
  final String _merchantTransactionId = DateTime.now().millisecondsSinceEpoch.toString();
  final String _merchantId = "PGTESTPAYUAT";

  // Phonepe init
  Future<dynamic> phonePeInit({
    String environment = "SANDBOX",
    String appId = "",
    String merchantId = "PGTESTPAYUAT",
    bool enableLogging = false,
  }) async {
    _getCheckSum();
    try {
      final bool result = await PhonePePaymentSdk.init(
          environment, appId, _merchantId, enableLogging);
          printDebug(result);
      return result;
    } catch (error) {
      printError(error);
      return {"error": error};
    }
  }

  // Strt Phonepe transaction
  Future<dynamic> startTransaction({
    //String body = "",
    String callBackUrl = "https://www.google.com/",
    // String checksum = "",
    String? packageName = "",
  }) async {
    try {
      final response = await PhonePePaymentSdk.startTransaction(
          _body, callBackUrl, _checkSum, packageName);

      // handle response

      if (response != null) {
        final String status = response["status"].toString();
        String error = response['error'].toString();
        if (status == "SUCCESS") {
          printDebug("Success");
          return {"result" : "Success"};
        } else {
          printWarning("flow completed with error----------------");
          printError("Flow  completed with status:$status error $error");
          return "Flow  completed with status:$status error $error";
        }
      } else {
        printWarning("Flow incompleted");
        return "Flow incompleted";
      }
    } catch (error) {
      print("Error------------------------------");
      printError(error);
      return "error:$error";
    }
  }

  void _getCheckSum() {
    final reqData = {
      "merchantId": _merchantId,
      "merchantTransactionId": _merchantTransactionId,
      "merchantUserId": "MUID123",
      "amount": 900,
      "callbackUrl": "https://www.google.com/",
      "mobileNumber": "9999999999",
      "paymentInstrument": {"type": "PAY_PAGE"}
    };

    String base64Body = base64.encode(utf8.encode(json.encode(reqData)));

    _checkSum =
        "${sha256.convert(utf8.encode(base64Body + _apiEndPoint + _saltKey)).toString()}###$_saltIndex";
        printWarning("checkSum, $_checkSum");

    _body = base64Body;

    printError("body : $_body");

    //return base64Body;
  }

  Future<dynamic> checPaymentStatus() async{
    try{
      final url = "$_merchantId/$_merchantTransactionId";
      String concatString = "/pg/v1/status/$_merchantId/$_merchantTransactionId$_saltKey";
      final bytes = utf8.encode(concatString);
      final digest = sha256.convert(bytes).toString();
      String xVerify = "$digest###$_saltIndex";

      Map<String, String> headers = {
        "Content-Type":"application/json",
        "X-VERIFY":xVerify,
        "X-MERCHANT-ID":_merchantId
      };

      final response = await dio.get(url,options: Options(headers: headers));

      if(response.statusCode==200){
        final data = response.data;
        printDebug("result success with data $data");
      }else{
        printWarning("result is not ok ${response.statusMessage}");
      }

    }catch(e){
      printError("checkstatus dio exception error ${e.toString()}");
      return "Error :- $e";
    }
  }
}
