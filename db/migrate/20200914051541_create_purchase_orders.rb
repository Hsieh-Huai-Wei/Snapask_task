class CreatePurchaseOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_orders do |t|
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
  end
end
