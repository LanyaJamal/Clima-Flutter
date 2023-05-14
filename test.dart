import 'dart:io';

void main() {
  print("start");
  performTasks();
  print("end");
}

void performTasks() {
  task1();
  task2();
  task3();
}

void task1() {
  print('Task 1 complete');
}

void task2() {
  Duration threeSecond = Duration(seconds: 3);
  sleep(threeSecond);
  print('Task 2 complete');
}

void task3() {
  print('Task 3 complete');
}
