class AddAttachmentMaterialToCourseMaterials < ActiveRecord::Migration
  def self.up
    change_table :course_materials do |t|
      t.attachment :material
    end
  end

  def self.down
    remove_attachment :course_materials, :material
  end
end
