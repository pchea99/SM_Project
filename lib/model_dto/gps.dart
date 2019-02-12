class Gps{
 String _latitude;
 String _longtitude;

 Gps(
     this._latitude,
     this._longtitude
     );

 String get longtitude => _longtitude;

 set longtitude(String value) {
   _longtitude = value;
 }

 String get latitude => _latitude;

 set latitude(String value) {
   _latitude = value;
 }

 @override
 String toString() {
   return 'Gps{_latitude: $_latitude, _longtitude: $_longtitude}';
 }

}