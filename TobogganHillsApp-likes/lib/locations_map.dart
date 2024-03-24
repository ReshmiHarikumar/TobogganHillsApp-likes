import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:toboggan_hills/src/features/details/page.dart'; // Import the details page

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  // Define the initial camera position to cover the bounding box of Canada
  CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(56.130366, -106.346771),
    zoom: 3.0,
  );

  Map<String, LatLng> locations = {
    'Hill 1': LatLng(68.03214658, -70.525901635),
    'Hill1': LatLng(43.37533435, -79.80991161),
    'Hill2': LatLng(43.713422, -79.541807),
    'Hill3': LatLng(43.81093849, -79.58681888),
    'Hill5': LatLng(43.66552141, -79.35981941),
    'Hill6': LatLng(43.67042619, -79.35492706),
    'Hill7': LatLng(43.727848, -79.579747),
    'Hill8': LatLng(43.59316505, -79.76851797),
    'Hill9': LatLng(45.68506681, -62.68791807),
    'Hill10': LatLng(43.91618264, -78.60507965),
    'Hill11': LatLng(44.80959524, -77.26337433),
    'Hill12': LatLng(43.00203911, -81.25343323),
    'Hill13': LatLng(45.4020358, -75.62554568),
    'Hill14': LatLng(45.44095489, -75.59929222),
    'Hill15': LatLng(45.47621736, -75.48838019),
    'Hill16': LatLng(45.45139877, -75.59269935),
    'Hill17': LatLng(45.36923131, -75.69193304),
    'Hill19': LatLng(43.67335, -79.346443),
    'Hill21': LatLng(43.658969, -79.463119),
    'Hill22': LatLng(43.648637, -79.413943),
    'Hill23': LatLng(43.643634, -79.465613),
    'Hill24': LatLng(43.5224951, -79.6211946),
    'Hill26': LatLng(43.72127022, -79.40416618),
    'Hill27': LatLng(43.66376215, -79.42075074),
    'Hill28': LatLng(35.50309025, -97.57459044),
    'Hill29': LatLng(36.15311862, -95.93406558),
    'Hill30': LatLng(40.43080858, -79.91496786),
    'Hill31': LatLng(51.06623389, -114.1250244),
    'Hill32': LatLng(47.52444431, -122.6442808),
    'Hill33': LatLng(47.68955806, -116.7604691),
    'Hill34': LatLng(44.02576768, -92.52187997),
    'Hill35': LatLng(53.30945159, -6.24807179),
    'Hill36': LatLng(43.00071274, -81.28132858),
    'Hill37': LatLng(42.892218, -81.44074492),
    'Hill38': LatLng(53.35704054, -6.329205965),
    'Hill39': LatLng(44.54645953, -80.93510972),
    'Hill40': LatLng(43.4326985, -79.9024738),
    'Hill41': LatLng(43.3035551, -79.845279),
    'Hill42': LatLng(43.3308111, -79.8867649),
    'Hill43': LatLng(43.53747384, -79.67374206),
    'Hill44': LatLng(51.10182145, -114.06087),
    'Hill45': LatLng(51.11885631, -114.1817411),
    'Hill46': LatLng(59.81741149, 17.6287479),
    'Hill47': LatLng(59.79060858, 17.66004605),
    'Hill48': LatLng(43.41872722, -80.48761753),
    'Hill49': LatLng(43.4048537, -79.76099439),
    'Hill50': LatLng(40.32452422, -7.612511516),
    'Hill51': LatLng(51.44742781, -0.035566092),
    'Hill52': LatLng(41.94826385, -91.65466547),
    'Hill53': LatLng(40.42762951, -84.97208067),
    'Hill54': LatLng(38.64008611, -90.29384613),
    'Hill55': LatLng(47.99712075, 37.80046055),
    'Hill56': LatLng(47.9883037, 37.78935621),
    'Hill57': LatLng(41.90557489, -90.18336654),
    'Hill58': LatLng(43.32246931, -76.40419364),
    'Hill59': LatLng(41.09170753, -81.68904662),
    'Hill60': LatLng(43.37143047, -79.83796822),
    'Hill61': LatLng(37.26634277, -79.96940204),
    'Hill62': LatLng(37.2633543, -79.95365747),
    'Hill63': LatLng(37.27206323, -79.98112329),
    'Hill64': LatLng(37.24636899, -79.97587689),
    'Hill65': LatLng(42.09590705, -70.95304656),
    'Hill66': LatLng(42.05682189, -71.08110481),
    'Hill67': LatLng(43.69239057, -79.44754601),
    'Hill68': LatLng(43.80585401, -79.3060112),
    'Hill69': LatLng(43.65870987, -79.46299128),
    'Hill70': LatLng(43.79011839, -79.35828209),
    'Hill71': LatLng(43.81351898, -79.15677309),
    'Hill72': LatLng(43.26442746, -79.89764321),
    'Hill73': LatLng(43.68171184, -79.48801092),
    'Hill74': LatLng(43.03569809, -81.2346796),
    'Hill75': LatLng(43.0468641, -81.28965416),
    'Hill76': LatLng(43.68289119, -79.40999083),
    'Hill89': LatLng(43.66085145, -79.4191404),
    'Hill91': LatLng(45.45238911, -75.57646996),
    'Hill92': LatLng(41.45226, -72.064567),
    'Hill93': LatLng(50.94134764, -102.0428354),
    'Hill94': LatLng(51.04237336, -102.1581919),
    'Hill95': LatLng(43.00888823, -81.27871075),
    'Hill96': LatLng(49.16128561, -101.8030245),
    'Hill100': LatLng(45.2914409, -75.88343497),
    'Hill101': LatLng(45.29656181, -75.90212728),
    'Hill102': LatLng(45.29255795, -75.86195047),
    'Hill103': LatLng(45.19384586, -75.82383092),
    'Hill104': LatLng(45.13022466, -75.708681),
    'Hill105': LatLng(45.22231053, -75.68834717),
    'Hill106': LatLng(45.27422187, -75.69084163),
    'Hill107': LatLng(45.2864837, -75.71659888),
    'Hill108': LatLng(45.29165789, -75.73595638),
    'Hill109': LatLng(45.28635726, -75.73963369),
    'Hill110': LatLng(45.2872574, -75.74766959),
    'Hill111': LatLng(45.32658928, -75.81208284),
    'Hill112': LatLng(45.33409979, -75.80120112),
    'Hill113': LatLng(45.33488416, -75.78866716),
    'Hill114': LatLng(45.33477669, -75.77238078),
    'Hill115': LatLng(45.34259152, -75.76871689),
    'Hill116': LatLng(45.3460659, -75.82785155),
    'Hill117': LatLng(45.34940812, -75.80875422),
    'Hill118': LatLng(45.35664231, -75.79854573),
    'Hill119': LatLng(45.38344111, -75.7543322),
    'Hill120': LatLng(45.37372891, -75.74410225),
    'Hill121': LatLng(49.04407804, -122.2582417),
    'Hill122': LatLng(49.05019068, -122.2646656),
    'Hill123': LatLng(45.35163615, -75.62627818),
    'Hill124': LatLng(45.38836534, -75.65492685),
    'Hill125': LatLng(45.39699583, -75.69103475),
    'Hill126': LatLng(45.31616192, -75.603871),
    'Hill127': LatLng(45.31788769, -75.59781457),
    'Hill128': LatLng(43.65573294, -79.76235676),
    'Hill129': LatLng(43.31656333, -89.54007055),
    'Hill130': LatLng(45.43356495, -75.67782487),
    'Hill131': LatLng(45.42137334, -75.66840495),
    'Hill132': LatLng(45.23730718, -75.47883446),
    'Hill133': LatLng(45.41815776, -75.62445159),
    'Hill135': LatLng(45.42479771, -75.6139266),
    'Hill136': LatLng(45.44419348, -75.60445572),
    'Hill137': LatLng(45.45128195, -75.59994425),
    'Hill138': LatLng(45.43282033, -75.55473561),
    'Hill139': LatLng(45.44387168, -75.53806032),
    'Hill140': LatLng(45.44995164, -75.53085859),
    'Hill141': LatLng(45.45733853, -75.51036383),
    'Hill142': LatLng(45.45961499, -75.50731148),
    'Hill143': LatLng(45.47045795, -75.50779964),
    'Hill144': LatLng(45.46850547, -75.49863453),
    'Hill145': LatLng(45.47734189, -75.50449516),
    'Hill146': LatLng(45.48766245, -75.52125628),
    'Hill147': LatLng(45.48354799, -75.49661215),
    'Hill148': LatLng(45.48111077, -75.4892173),
    'Hill149': LatLng(45.47975859, -75.48128869),
    'Hill150': LatLng(45.46594156, -75.48268612),
    'Hill151': LatLng(45.47171255, -75.47361757),
    'Hill152': LatLng(45.47410504, -75.45217867),
    'Hill153': LatLng(45.51515467, -75.40309425),
    'Hill154': LatLng(43.7116412, -79.73098431),
    'Hill155': LatLng(42.00162144, -87.68730476),
    'Hill156': LatLng(42.02355901, -87.70532921),
    'Hill157': LatLng(41.99795381, -87.78755501),
    'Hill158': LatLng(41.86488355, -87.61713817),
    'Hill159': LatLng(43.92317252, -78.87057327),
    'Hill160': LatLng(47.67323153, -122.3134134),
    'Hill161': LatLng(47.75167141, -122.3666233),
    'Hill162': LatLng(49.91896556, -97.07628033),
    'Hill163': LatLng(49.89858932, -96.98086074),
    'Hill164': LatLng(49.93193355, -97.03599891),
    'Hill165': LatLng(39.68049932, -79.78395111),
    'Hill166': LatLng(48.42388021, -123.4926387),
    'Hill167': LatLng(49.06371775, -122.3631617),
    'Hill168': LatLng(48.84547774, 18.10248011),
    'Hill169': LatLng(43.56713876, -79.73487555),
    'Hill170': LatLng(44.36801293, -64.52813961),
    'Hill174': LatLng(41.81188603, -72.24544614),
    'Hill175': LatLng(41.81652389, -72.24527448),
    'Hill176': LatLng(42.71864466, -71.09510034),
    'Hill177': LatLng(43.64393161, -79.91695397),
    'Hill178': LatLng(43.68288344, -79.97058127),
    'Hill179': LatLng(43.63252437, -80.02661981),
    'Hill180': LatLng(43.50628684, -79.86688898),
    'Hill181': LatLng(43.72705928, -79.72463724),
    'Hill182': LatLng(49.32020378, -55.39723023),
    'Hill183': LatLng(43.54861859, -79.65351418),
    'Hill184': LatLng(43.73507449, -79.50438109),
    'Hill185': LatLng(47.5234741, -52.75242522),
    'Hill186': LatLng(43.38503911, -80.31125866),
    'Hill189': LatLng(43.39230261, -79.71579968),
    'Hill190': LatLng(43.70066805, -79.47663246),
    'Hill191': LatLng(43.64811179, -79.92087005),
    'Hill192': LatLng(45.50280001, -73.58995556),
    'Hill193': LatLng(45.51501046, -73.58823894),
    'Hill194': LatLng(45.39969095, -122.7275985),
    'Hill196': LatLng(43.70578713, -79.40586506),
    'Hill197': LatLng(43.69035101, -79.42863165),
    'Hill198': LatLng(51.28774182, -113.9924338),
    'Hill199': LatLng(51.0588623, -113.9459672),
    'Hill200': LatLng(51.27484355, -114.0005018),
    'Hill201': LatLng(51.24125213, -113.985063),
    'Hill202': LatLng(51.10360947, -113.9735188),
    'Hill204': LatLng(55.36300386, -116.3838496),
    'Hill205': LatLng(43.50930468, -79.86075305),
    'Hill206': LatLng(43.51479797, -79.88787554),
    'Hill207': LatLng(43.50335953, -79.94598292),
    'Hill208': LatLng(42.45324921, -81.7021047),
    'Hill209': LatLng(43.50544507, -79.86313056),
    'Hill210': LatLng(43.13949274, -79.19459171),
    'Hill211': LatLng(53.64581789, -113.630706),
    'Hill212': LatLng(43.55074944, -79.64680253),
    'Hill213': LatLng(43.56496984, -79.66026722),
    'Hill214': LatLng(43.32359114, -79.82849813),
    'Hill215': LatLng(41.32333443, -72.92011107),
    'Hill216': LatLng(44.00531033, -77.12517201),
    'Hill217': LatLng(44.19210593, -77.39457308),
    'Hill218': LatLng(42.4967093, -73.82584844),
    'Hill219': LatLng(42.65157951, -73.82153545),
    'Hill220': LatLng(43.7516003, -81.7080148),
    'Hill221': LatLng(43.74043163, -81.69498999),
    'Hill222': LatLng(43.2463266, -79.90710078),
    'Hill223': LatLng(43.36648825, -80.32129406),
    'Hill224': LatLng(52.15617184, 0.174198232),
    'Hill225': LatLng(50.29129328, -107.7786328),
    'Hill226': LatLng(48.48384709, -123.3243489),
    'Hill227': LatLng(43.20351418, -79.80949143),
    'Hill228': LatLng(43.21066955, -79.77459589),
    'Hill229': LatLng(43.3361204, -79.90182021),
    'Hill230': LatLng(43.20872734, -79.80152705),
    'Hill231': LatLng(49.87260111, -97.23332366),
    'Hill232': LatLng(43.21058547, -79.90447834),
    'Hill233': LatLng(43.43331846, -80.42141983),
    'Hill234': LatLng(43.42084376, -80.53216287),
    'Hill235': LatLng(43.41651871, -80.52794644),
    'Hill236': LatLng(44.67555211, -63.49612772),
    'Hill237': LatLng(44.62859783, -63.51214587),
    'Hill238': LatLng(44.63549224, -63.58385205),
    'Hill239': LatLng(44.64621778, -63.58084261),
    'Hill240': LatLng(44.64462243, -63.63872468),
    'Hill241': LatLng(44.6652059, -63.6013025),
    'Hill242': LatLng(44.67175261, -63.61066877),
    'Hill243': LatLng(44.64235528, -63.61277162),
    'Hill244': LatLng(44.6757047, -63.57102572),
    'Hill245': LatLng(44.66896005, -63.57194304),
    'Hill246': LatLng(44.7147137, -63.44798743),
    'Hill247': LatLng(44.66084101, -63.5399872),
    'Hill248': LatLng(44.66552639, -63.54844152),
    'Hill249': LatLng(44.70419294, -63.56182038),
    'Hill250': LatLng(44.67854271, -63.53948831),
    'Hill251': LatLng(61.07174799, -146.0885822),
    'Hill254': LatLng(45.02030549, -74.75128769),
    'Hill255': LatLng(45.09515355, -74.79654192),
    'Hill256': LatLng(44.39675838, -79.70916925),
    'Hill257': LatLng(46.52261099, -84.28863668),
    'Hill258': LatLng(44.28852146, -79.43471134),
    'Hill259': LatLng(50.49039346, -104.5976974),
    'Hill260': LatLng(43.85199031, -79.07758816),
    'Hill261': LatLng(42.77146934, -81.06636578),
    'Hill262': LatLng(43.66946326, -79.32783423),
    'Hill263': LatLng(42.95542359, -81.26105124),
    'Hill264': LatLng(48.8675908, 20.90681676),
    'Hill265': LatLng(39.79442469, -84.08668399),
    'Hill266': LatLng(45.15280864, -93.68353128),
    'Hill267': LatLng(50.75486642, 6.020464897),
    'Hill268': LatLng(41.48205848, -87.07551241),
    'Hill269': LatLng(41.51911752, -87.06450462),
    'Hill270': LatLng(39.92843138, -74.93302345),
    'Hill271': LatLng(40.31212693, -74.51155186),
    'Hill272': LatLng(42.60149359, -82.37392724),
    'Hill273': LatLng(43.45247495, -76.52294576),
    'Hill274': LatLng(43.42331539, -76.54134035),
    'Hill275': LatLng(40.3873427, -74.7589159),
    'Hill276': LatLng(43.74387879, -79.37671959),
    'Hill277': LatLng(46.43274023, -81.14753008),
    'Hill278': LatLng(42.93124341, -81.23247564),
    'Hill279': LatLng(42.23067819, -84.43463087),
    'Hill280': LatLng(43.68643246, -79.36903238),
    'Hill281': LatLng(44.04299513, -79.46192265),
    'Hill282': LatLng(52.45831065, -1.852827072),
    'Hill283': LatLng(50.53680064, -103.6739592),
    'Hill284': LatLng(52.98487535, -113.3580923),
    'Hill285': LatLng(43.92186757, -80.10602832),
    'Hill286': LatLng(43.90627215, -80.12112379),
    'Hill287': LatLng(43.75833173, -79.50364602),
    'Hill288': LatLng(42.58819316, -82.37323523),
    'Hill289': LatLng(37.52160576, -77.58090824),
    'Hill290': LatLng(36.1857927, -81.87534213),
    'Hill292': LatLng(41.67946175, -70.17565863),
    'Hill293': LatLng(45.44272352, -65.97537875),
    'Hill294': LatLng(45.40918192, -65.99004775),
    'Hill295': LatLng(39.53932978, -104.8060298),
    'Hill296': LatLng(44.47014311, -80.05700827),
    'Hill297': LatLng(43.56879384, -80.26613474),
    'Hill298': LatLng(44.57778263, -75.69887996),
    'Hill299': LatLng(44.61494971, -75.70161045),
    'Hill300': LatLng(42.19809098, -72.630748),
    'Hill301': LatLng(42.19848839, -72.62712702),
    'Hill302': LatLng(50.69895848, -103.4691525),
    'Hill303': LatLng(43.36345655, -79.76736188),
    'Hill304': LatLng(45.2276343, -75.46598911),
    'Hill305': LatLng(43.81274478, -79.443115),
    'Hill306': LatLng(44.10752551, -79.57238138),
    'Hill307': LatLng(42.96629971, -81.30478263),
    'Hill308': LatLng(43.00069263, -81.3050133),
    'Hill309': LatLng(42.94637096, -81.32490993),
    'Hill310': LatLng(40.07629818, -75.20147181),
    'Hill311': LatLng(39.99122677, -75.21251392),
    'Hill312': LatLng(39.9328082, -75.21599007)
  };

  // Method to move the camera to a specific location
  Future<void> _moveToLocation(LatLng location) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLng(location));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toboggan Hill Map'),
      ),
      body: GestureDetector(
        onTap: () {
          // Handle tap gestures here
        },
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _initialCameraPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: Set<Marker>.of(
                locations.entries.map((MapEntry<String, LatLng> entry) {
                  return Marker(
                    markerId: MarkerId(entry.key),
                    position: entry.value,
                    infoWindow: InfoWindow(
                      title: entry.key,
                      onTap: () {
                        // Open details page when info window is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailsPage(locationName: entry.key),
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
              zoomControlsEnabled: false, // Disable default zoom controls
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: [
                    FloatingActionButton(
                      heroTag: "zoom_in",
                      onPressed: () async {
                        final GoogleMapController controller =
                            await _controller.future;
                        controller.animateCamera(CameraUpdate.zoomIn());
                      },
                      child: Icon(Icons.add),
                    ),
                    SizedBox(height: 8),
                    FloatingActionButton(
                      heroTag: "zoom_out",
                      onPressed: () async {
                        final GoogleMapController controller =
                            await _controller.future;
                        controller.animateCamera(CameraUpdate.zoomOut());
                      },
                      child: Icon(Icons.remove),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String locationName;

  const DetailsPage({Key? key, required this.locationName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(locationName),
      ),
      body: Center(
        child: Text('Details of $locationName'), // Display details of the location
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MapSample(),
  ));
}
