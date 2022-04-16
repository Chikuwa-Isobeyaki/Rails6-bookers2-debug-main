class ChangeBrowsingHistoriesToViewCounts < ActiveRecord::Migration[6.1]
  def change
    rename_table :browsing_histories, :view_counts
  end
end
