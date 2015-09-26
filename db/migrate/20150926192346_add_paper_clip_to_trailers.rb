class AddPaperClipToTrailers < ActiveRecord::Migration
  def change
      add_column :trailers, :doc_file_name, :string
      add_column :trailers, :doc_content_type, :string
      add_column :trailers, :doc_file_size, :integer
      add_column :trailers, :doc_comment, :text
      add_column :trailers, :doc_updated_at, :datetime
  end
end
