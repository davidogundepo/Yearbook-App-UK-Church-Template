
import 'package:bloc/bloc.dart';
import '../thrown_pages/sanctuary_keepers_thrown_page.dart';
import '../thrown_pages/pastors_thrown_page.dart';
import '../thrown_pages/evangelical_unit_thrown_page.dart';
import '../thrown_pages/noblemen_network_thrown_page.dart';
import '../thrown_pages/choir_thrown_page.dart';
import '../thrown_pages/media_unit_thrown_page.dart';

enum NavigationEvents {
  myPastorsPageClickedEvent,
  myChoirPageClickedEvent,
  myMediaUnitPageClickedEvent,
  mySanctuaryKeepersPageClickedEvent,
  myEvangelicalUnitPageClickedEvent,
  myNoblemenNetworkPageClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {

  NavigationBloc() : super(MyPastorsPage());

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.myPastorsPageClickedEvent:
        yield MyPastorsPage();
        break;
      case NavigationEvents.myChoirPageClickedEvent:
        yield MyChoirPage();
        break;
      case NavigationEvents.myMediaUnitPageClickedEvent:
        yield MyMediaUnitPage();
        break;
      case NavigationEvents.mySanctuaryKeepersPageClickedEvent:
        yield MySanctuaryKeepersPage();
        break;
      case NavigationEvents.myEvangelicalUnitPageClickedEvent:
        yield MyEvangelicalUnitPage();
        break;
      case NavigationEvents.myNoblemenNetworkPageClickedEvent:
        yield MyNoblemenNetworkPage();
        break;
    }
  }


}
