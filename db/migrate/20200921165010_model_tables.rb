class ModelTables < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :plot
      t.timestamps
    end

    create_table :seasons do |t|
      t.string :title
      t.string :plot
      t.integer :number
      t.timestamps
    end

    create_table :episodes do |t|
      t.string :title
      t.string :plot
      t.integer :number
      t.references :season
      t.timestamps
    end

    create_table :purchase_options do |t|
      t.float :price
      t.string :video_quality
      t.references :content, polymorphic: true
      t.timestamps
    end

    create_table :users do |t|
      t.string :email
      t.timestamps
    end

    create_table :purchases do |t|
      t.references :user
      t.references :purchase_option
      t.datetime :expires_at
      t.timestamps
    end
  end
end
