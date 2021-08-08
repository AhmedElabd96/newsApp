abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomState extends NewsStates{}

class NewsLoadingBusiness extends NewsStates{}
class NewsGetBusinessSuccess extends NewsStates{}

class NewsGetBusinessFailed extends NewsStates{
  final String err ;
  NewsGetBusinessFailed(this.err);

}

class AppModeTheme extends NewsStates{}
