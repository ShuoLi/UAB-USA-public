class CreateCompanyInfos < ActiveRecord::Migration
  def change
    create_table :company_infos do |t|
      t.string :name
      t.string :phone
      t.text :address

      t.timestamps
    end
  end
end
