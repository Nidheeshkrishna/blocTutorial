import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/bloc/CounterBloc/bloc/countre_bloc_bloc.dart';

import 'package:flutter_applicationgoogle_drive/utilities/Sizeconfig.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: SizeConfig.screenwidth,
        height: SizeConfig.screenheight,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CountreBlocBloc, CountreBlocState>(
                builder: (context, state) {
                  if (state is CountreBlocSuccessState) {
                    return Text(state.counter.toString());
                  } else {
                    return Container();
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CountreBlocBloc>(context)
                          .add(CounterIncrement());
                    },
                    child: const Icon(
                      Icons.add,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CountreBlocBloc>(context)
                          .add(CounterDecrement());
                    },
                    child: const Icon(
                      Icons.remove,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ]),
      ),
    );
  }
}
