class CreatePortfolios < ActiveRecord::Migration
  def up
    # Portfolios
    create_table :portfolios do |t|
      t.string :name, null: false
    end
    add_index :portfolios, :name

    # Quotes
    create_table :quotes do |t|
      t.string :name,   null: false
      t.string :ticker, null: false
    end
    add_index :quotes, :name
    add_index :quotes, :ticker

    create_table :exchanges do |t|
      t.string :name, null: false
    end
    add_index :exchanges, :name, unique: true

    create_table :metrics do |t|
      t.string :name,  null: false
      t.string :regex, null: false
      t.references :exchange
    end
    add_index :metrics, :name
    add_index :metrics, :exchange_id
    add_index :metrics, [:name, :exchange_id], unique: true

    # HABTM entries
    create_table :portfolios_quotes, id: false do |t|
      t.integer :portfolio_id, null: false
      t.integer :quote_id,     null: false
    end
    add_index :portfolios_quotes, [:portfolio_id, :quote_id], unique: true

    create_table :exchanges_quotes, id: false do |t|
      t.integer :exchange_id, null: false
      t.integer :quote_id,    null: false
    end
    add_index :exchanges_quotes, [:exchange_id, :quote_id], unique: true

    Portfolio.create_translation_table! name: :string
    Quote.create_translation_table!     name: :string
    Exchange.create_translation_table!  name: :string
    Metric.create_translation_table!    name: :string
  end

  def down
    Portfolio.drop_translation_table!
    Quote.drop_translation_table!
    Exchange.drop_translation_table!
    Metric.drop_translation_table!

    drop_table :metrics
    drop_table :exchanges
    drop_table :quotes
    drop_table :portfolios
  end
end
