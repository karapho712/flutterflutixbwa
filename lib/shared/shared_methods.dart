part of 'shared.dart';

Future<File> getImage() async {
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);

  return image;
}

Future<String> uploadImage(File image) async {
  String fileName = basename(image.path);
  String url;

  // StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
  Reference ref = FirebaseStorage.instance.ref().child(fileName);

  // StorageUploadTask task = ref.putFile(image);
  UploadTask task = ref.putFile(image);

  // StorageTaskSnapshot snapshot = await task.onComplete;
  // UploadTask snapshot = await task.onComplete;

  // task.then((event) {
  //   // Future<String> url = event.ref.getDownloadURL();
  //   String url = event.ref.getDownloadURL().toString();
  // });

  // return await snapshot.ref.getDownloadURL();

  // return url;

  // task.then((res) {
  //   return res.ref.getDownloadURL();
  // });

  task.whenComplete(() async {
    url = await ref.getDownloadURL();
  }).catchError((onError) {
    print(onError);
  });

  return url;

  // YANG INI BAGIAN LAMA DAN BERHASIL
  // String fileName = basename(image.path);

  // StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
  // StorageUploadTask task = ref.putFile(image);
  // StorageTaskSnapshot snapshot = await task.onComplete;

  // return await snapshot.ref.getDownloadURL();
}
