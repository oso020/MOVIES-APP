import '../../../../model/discover.dart';

abstract class DiscoverState{}
class DiscoverLoadingSate extends DiscoverState{}
class DiscoverErrorSate extends DiscoverState{
  String errorMessage;
  DiscoverErrorSate({required this.errorMessage});
}
class DiscoverSuccessSate extends DiscoverState{
  List<Results> resultsList;
  DiscoverSuccessSate({required this.resultsList});
}