class CreateEvaluacions < ActiveRecord::Migration
  def change
    create_table :evaluacions do |t|
      t.string :resp1
      t.string :resp2
      t.string :resp3
      t.string :resp4
      t.string :resp5
      t.string :resp6
      t.string :resp7
      t.string :resp8
      t.string :resp9
      t.string :resp10
      t.string :conclusion

      t.timestamps null: false
    end
  end
end
