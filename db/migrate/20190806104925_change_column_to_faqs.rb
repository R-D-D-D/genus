class ChangeColumnToFaqs < ActiveRecord::Migration[5.2]
  def change
    change_column :faqs, :answer, :text
  end
end
