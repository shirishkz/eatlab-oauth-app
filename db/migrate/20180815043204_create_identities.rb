class CreateIdentities < ActiveRecord::Migration[5.2]
  def change
    create_table :identities do |t|
      t.references :user, foreign_key: true
      t.string :provider
      t.string :accesstoken
      t.string :refreshtoken
      t.string :uid
      t.string :name
      t.string :email
      t.string :nickname
      t.integer :age
      t.string :gender
      t.string :location
      t.string :hometown
      t.string :image
      t.string :urls

      t.timestamps
    end
  end
end
