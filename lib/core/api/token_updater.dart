
import '../../utils/response.dart';

abstract class TokenUpdater{
  Future<Result> getNewTokens();

}