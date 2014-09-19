library ajax_file_upload;
import "dart:html";
import "dart:async";


class AjaxFileUploader{
  FileUploadInputElement _fuim;
  String _targetURL;
  Completer<String> _uploadedFile = new Completer<String>();
  Future<String> get fileUploaded  {
    var fd = new FormData();
    fd.appendBlob("file", _fuim.files[0]);
    HttpRequest.request(_targetURL,method:"post", withCredentials:false,sendData:fd).then((req){
      _uploadedFile.complete(req.responseText);
    });

    return _uploadedFile.future;
  }
  AjaxFileUploader(this._fuim,this._targetURL);
}