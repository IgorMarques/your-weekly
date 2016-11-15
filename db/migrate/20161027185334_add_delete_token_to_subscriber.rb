class AddDeleteTokenToSubscriber < ActiveRecord::Migration[5.0]
  def change
    add_column :subscribers, :delete_token, :string, index: true
  end
end
