require_relative "extra_doilies/version"
require "table_cloth"
module ExtraDoilies
  # autoload all the .rb in filters under this namespace
  def self.library_files
    Dir.glob("#{File.dirname(__FILE__)}/extra_doilies/*.rb")
  end
  def self.file_name_to_class_name(filename)
    File.basename(filename, '.*').split('_').collect(&:capitalize).join.to_sym
  end
  library_files.each do |filename|
    autoload file_name_to_class_name(filename), filename
  end
end
