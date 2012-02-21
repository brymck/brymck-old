class LastBit < ActiveRecord::Migration
  def up
    matches = ActiveRecord::Base.connection.execute("SELECT b.id, a.locale, a.title, a.description FROM code_translations a, code b WHERE a.code_id = b.id")
    matches.each do |match|
      @code = Code.find_by_id(match["id"])
      if match["locale"] == "en"
        @code.update_attribute :title_en, match["title"]
        @code.update_attribute :description_en, match["description"]
      else
        @code.update_attribute :title_ja, match["title"]
        @code.update_attribute :description_ja, match["description"]
      end
    end

    rename_column :languages, :url, :url_en
    add_column    :languages, :url_ja, :string

    matches = ActiveRecord::Base.connection.execute("SELECT b.id, a.locale, a.url FROM language_translations a, languages b WHERE a.language_id = b.id")
    matches.each do |match|
      @language = Language.find_by_id(match["id"])
      if match["locale"] == "en"
        @language.update_attribute :url_en, match["url"]
      else
        @language.update_attribute :url_ja, match["url"]
      end
    end

    drop_table :exchanges_quotes
    drop_table :exchange_translations
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't recover the deleted tables"
  end
end
