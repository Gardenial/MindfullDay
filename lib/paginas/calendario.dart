// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mindfullday_v1/util/event.dart';
import 'package:mindfullday_v1/util/navbar.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendario extends StatefulWidget {
  const Calendario({super.key});

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  List<Evento> _getEventsForDay(DateTime day){
    return events[day] ?? [];
  }

  late final ValueNotifier<List<Evento>> _selectedEvents;

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedEvents.value = _getEventsForDay(selectedDay);
      });
    }
  }
  Map<DateTime, List<Evento>> events = {};
  TextEditingController _eventController = TextEditingController();
  TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Calendário'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context, 
            builder: (context) {
              return AlertDialog(
                scrollable: true,
                title: Text('Nome da Tarefa'),
                content: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      TextField(
                          controller: _eventController,
                          decoration: InputDecoration(
                            hintText: "Nome da Tarefa"
                          ),
                        ),
                        TextField(
                          controller: _descController,
                          decoration: InputDecoration(
                            hintText: "Descrição da Tarefa"
                          ),
                        ),
                    ],
                  ),
                  
                ),

                actions: [
                  ElevatedButton(
                    onPressed: () {
                      events.addAll({
                        _selectedDay!: [Evento(_eventController.text)] 
                      });
                      Navigator.of(context).pop();
                      _selectedEvents.value = _getEventsForDay(_selectedDay!);
                    }, 
                    child: Text('Criar Tarefa')
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              child: TableCalendar(
                locale: 'pt-BR', 
                headerStyle: 
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) =>isSameDay(_selectedDay, day),
                focusedDay: _focusedDay,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                onDaySelected: _onDaySelected,
                eventLoader: _getEventsForDay,
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ValueListenableBuilder<List<Evento>>(
                valueListenable: _selectedEvents, 
                builder: (context, value, _) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          onTap: () => print(""),
                          title: Text('${value[index]}'),
                        ),
                      );
                    },
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}