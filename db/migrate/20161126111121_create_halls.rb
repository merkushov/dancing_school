class CreateHalls < ActiveRecord::Migration[5.0]
  def change

    # создание новой таблицы Залы филиала
    create_table :halls do |t|
      t.references :location, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end

    # сменить привязку Занятия от Филиала к Залу
    reversible do |dir|
      change_table :class_schedules do |t|

        # migrate
        dir.up {
          t.remove :location_id
          t.references :hall, foreign_key: true
        }

        # rollback
        dir.down {
          t.remove :hall_id
          t.references :location, foreign_key: true
        }

      end
    end

  end
end
