class AddDownloadUrlToProduct < ActiveRecord::Migration
  def change
    add_column :products, :downloadurl, :string
  end
end
