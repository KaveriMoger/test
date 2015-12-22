class ClientsDocuments < ActiveRecord::Migration
  def change
   create_table :clients_documents, :id => false do |t|
   t.integer :client_id
   t.integer :document_id
  end
  end
end
