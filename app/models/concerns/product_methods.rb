module ProductMethods
  extend ActiveSupport::Concern

  included do
    
    #methods here
    def self.import(file_path)
      spreadsheet = open_spreadsheet(file_path)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        Product.create! row.to_hash  
      end
    end

    def self.open_spreadsheet(file_path)
      Roo::Spreadsheet.open(file_path, extension: :xlsx)
      #case File.extname(file.original_filename)
      #when ".csv" then Roo::Csv.new(file.path, {})
      #when ".xls" then Roo::Excel.new(file.path, {})
      #when ".xlsx" then Roo::Excelx.new(file.path, {})
      #else raise "Unknow file type: #{file.original_filename}"
      #end
    end

  end
end
