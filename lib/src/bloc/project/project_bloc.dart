import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_immo/src/bloc/project/project_event.dart';
import 'package:mad_immo/src/bloc/project/project_state.dart';

/*class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc(ProjectState initialState) : super(initialState);

  @override
  Future<Stream> mapEventToState(ProjectEvent event) async {
    if (event is AppLoaded) {
      yield* _mapAppLoadedToState(event);
    }

    if (event is UserLoggedIn) {
      yield* _mapUserLoggedInToState(event);
    }

    if (event is UserLoggedOut) {
      yield* _mapUserLoggedOutToState(event);
    }
  }
  
}*/
