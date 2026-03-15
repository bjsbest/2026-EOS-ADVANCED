import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/models/todo.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Mock Data
    final List<Todo> mockTodos = [
      Todo(id : 1, title : '회합 참여하기', date : DateTime(2026, 3, 16), userId: 1),
      Todo(id : 2, title : '뒤풀이 가기', date : DateTime(2026, 3, 16), userId: 1),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('나의 TODO', style: TextStyle(color: Colors.black)),
        elevation: 0,
        centerTitle: true,
        // 로그아웃 버튼
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: (){
            context.go('/login'); // Todo : context go
          },
        ),
        // 친구 목록 버튼
        actions: [
          IconButton(
            icon: const Icon(Icons.people),
            onPressed: (){
              // 친구 목록 화면으로 이동
              context.push('/friends'); // Todo : context push
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 1. 상단 고정 캘린더
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            // 현재 선택된 날짜, 날짜 클릭 시 이벤트는 viewModel을 이용한 상태관리 필요 (Week 3)
            // 현재 코드에서는 날짜 변경 안됨!
            calendarStyle: const CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.black,
                shape : BoxShape.circle,
              ),
              defaultTextStyle: TextStyle(fontSize: 14),
              weekendTextStyle: TextStyle(fontSize: 14),
            ),
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
          ),
          
          // 2. 하단 선택된 날짜의 Todo 리스트
          Expanded(
            child: Container(
              color: Colors.white,
              child : mockTodos.isEmpty
                    ? _buildEmptyState()
                    : _buildTodoList(mockTodos), // TODO : 조건부 렌더링
            ),
          ),
        ],
      ),
      // 3. 할일 추가 버튼
      floatingActionButton : FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }


  Widget _buildEmptyState(){
    return const Center(
      child: Text("이 날은 할 일이 없어요!"),
    );
  }

  Widget _buildTodoList(List<Todo> todos){
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: todos.length,
      itemBuilder: (context, index){
        final todo = todos[index];
        return Card(
          child: ListTile(
            tileColor: Colors.grey[100],
            leading: Checkbox(
              value: todo.completed,
              onChanged: null, // 클릭 불가
            ),
            title: Text(
              todo.title,
              style: TextStyle(fontSize : 15),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit_outlined), 
                  iconSize: 15, 
                  color: Colors.blueGrey,
                  onPressed: (){
                    print("log : ${todo.title} 내용 수정 클릭");
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline), 
                  iconSize: 15, 
                  color: Colors.blueGrey,
                  onPressed: (){
                    print("log : ${todo.title} todo 삭제 클릭");
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}