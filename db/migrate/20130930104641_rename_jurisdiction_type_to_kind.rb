class RenameJurisdictionTypeToKind < ActiveRecord::Migration
  def change
    rename_column(:jurisdictions, :type, :kind)
  end
end
