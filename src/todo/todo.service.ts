import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateTodoDto } from './dto/create-todo.dto';
import { UpdateTodoDto } from './dto/update-todo.dto';
import { Todo } from './entities/todo.entity';
export interface TodoType {
  todoId: string;
  contents: string;
  ynCompleted: boolean;
}

@Injectable()
export class TodoService {
  constructor(
    @InjectRepository(Todo) private readonly todoRepository: Repository<Todo>,
  ) {}
  async create(createTodoDto: CreateTodoDto) {
    const todo: Todo = new Todo();
    todo.contents = createTodoDto.contents;
    todo.dtCreate = new Date() as Date;
    todo.dtDue = new Date() as Date;
    const saveTodo = await this.todoRepository.save(todo);
    return saveTodo || {};
  }

  async findAll() {
    return await this.todoRepository.find({ order: { todoId: 'DESC' } });
  }

  async findOne(id: number) {
    const todo = await this.todoRepository.findOne({ where: { todoId: id } });
    return todo || {};
  }

  async update(id: number, updateTodoDto: UpdateTodoDto) {
    const todo = await this.todoRepository.findOne({ where: { todoId: id } });
    if (!todo) return 'Data not found';
    const newTodo: Todo = new Todo();
    newTodo.contents = updateTodoDto.contents;
    newTodo.todoId = id;
    return await this.todoRepository.save(newTodo);
  }

  async remove(id: number) {
    const delData = await this.todoRepository.delete({ todoId: id });
    if (!delData.affected) return 'Delete Data failed';
    return 'Delete data successfully';
  }
}
