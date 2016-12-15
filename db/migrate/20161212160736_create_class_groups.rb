class CreateClassGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :class_groups do |t|
      t.string :name

      t.timestamps
    end

    # добавить связку к таблице class_schedules
    reversible do |dir|
      change_table :class_schedules do |t|

        # migrate
        dir.up {
          t.references :class_groups, foreign_key: true
        }

        # rollback
        dir.down {
          t.remove :class_group_id
        }

      end
    end
  end
end
