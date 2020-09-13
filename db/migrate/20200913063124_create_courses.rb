class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.float :price
      t.string :currency
      t.string :course_type
      t.boolean :is_available
      t.text :link
      t.text :description
      t.date :expiry_date

      t.timestamps
    end
  end
end
