
enum Flavor {prod, dev}

class Env {
  static const currentFlavor = Flavor.dev;

  //======================================== REST API ========================================//
 static String get baseApiUrl {
  if (currentFlavor == Flavor.dev){
      return "https://dev.primuse.dev/pclub";
  }

  return "https://dev.primuse.dev/pclub";
}

//======================================== END REST API ========================================//

}
