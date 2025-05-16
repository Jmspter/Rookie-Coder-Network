class AddButtonLinkToArticles < ActiveRecord::Migration[8.0]
  def change
    add_column :articles, :button_link, :string
  end
end
