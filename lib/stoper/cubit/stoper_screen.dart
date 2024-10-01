import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phasmohelper/config/di.dart';
import 'package:flutter_phasmohelper/stoper/cubit/stoper_cubit.dart';
import 'package:flutter_phasmohelper/stoper/cubit/stoper_state.dart';

class StoperScreen extends StatefulWidget {
  @override
  State<StoperScreen> createState() => _StoperScreenState();
}

class _StoperScreenState extends State<StoperScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoperCubit, StoperState>(
      bloc: getIt<StoperCubit>(),
      builder: (context, state) {
        return SizedBox(
          height: 40,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        color: Colors.green,
                        minHeight: 20,
                        value: state.counter / 180,
                        semanticsLabel: "sda",
                        semanticsValue: "sda",
                        // borderRadius: BorderRadius.circular(20),
                      ),
                      Text("${state.counter}"),
                      Row(
                        children: [
                          const Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Text("duch 1"),
                          ),
                          Container(
                            width: 1,
                            color: Colors.black,
                          ),
                          const Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Text("duch 2"),
                          ),
                          Container(
                            width: 1,
                            color: Colors.black,
                          ),
                          const Flexible(
                            fit: FlexFit.tight,
                            flex: 2,
                            child: Text("duch 1"),
                          ),
                          // const Spacer(),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () {
                      state.status != StoperStatus.start
                          ? getIt<StoperCubit>().start()
                          : getIt<StoperCubit>().stop();
                    },
                    child: state.status != StoperStatus.pause
                        ? const Text("Pause")
                        : const Text("Start")),
              ],
            ),
          ),
        );
      },
    );
  }
}
