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
        const color = Color.fromARGB(255, 197, 242, 241);
        return SizedBox(
          height: 40,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        color: const Color.fromARGB(255, 127, 240, 132),
                        backgroundColor: color,
                        minHeight: 20,
                        value: (state.counter) / 60,
                        semanticsLabel: "sda",
                        semanticsValue: "sda",
                        // borderRadius: BorderRadius.circular(20),
                      ),
                      const Text("Safe",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                Container(width: 1, color: Colors.black),
                Flexible(
                  flex: 2,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        color: const Color.fromARGB(255, 222, 214, 109),
                        backgroundColor: color,
                        minHeight: 20,
                        value: (state.counter - 60) / 30,
                        semanticsLabel: "sda",
                        semanticsValue: "sda",
                        // borderRadius: BorderRadius.circular(20),
                      ),
                      const Text("Demon",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                Container(width: 1, color: Colors.black),
                Flexible(
                  flex: 3,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        color: const Color.fromARGB(255, 233, 165, 165),
                        backgroundColor: color,
                        minHeight: 20,
                        value: (state.counter - 90) / 90,
                        semanticsLabel: "sda",
                        semanticsValue: "sda",
                        // borderRadius: BorderRadius.circular(20),
                      ),
                      const Text("Without Spirit",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  flex: 3,
                  child: ElevatedButton(
                      onPressed: () {
                        state.status != StoperStatus.start
                            ? getIt<StoperCubit>().start()
                            : getIt<StoperCubit>().stop();
                      },
                      child: state.status != StoperStatus.pause
                          ? const Text("Pause")
                          : const Text("Start")),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
