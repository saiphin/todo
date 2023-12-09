import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Todo {
  @PrimaryGeneratedColumn()
  todoId: number;

  @Column({ type: 'varchar', length: 2000 })
  contents: string;

  @Column({ type: 'boolean', default: true })
  ynCompleted: boolean;

  @Column({ type: 'date' })
  dtCreate: Date;

  @Column({ type: 'date' })
  dtDue: Date;
}
