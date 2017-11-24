class Proyecto < ActiveRecord::Base
	belongs_to :investigador
  has_and_belongs_to_many :evaluadores
  has_and_belongs_to_many :estados


  has_attached_file :plantilla
  validates_attachment :plantilla, content_type: {content_type: %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document), 
                                                        message: 'Tipo invalido (Tipos permitidos *.doc *.pdf y*.odt)'}

	#  validate :file_size_under_one_mb

  #def initialize(params = {})
  #  @file = params.delete(:file)
   # super
    #if @file
     # self.filename = sanitize_filename(@file.original_filename)
      #self.content_type = @file.content_type
      #self.file_contents = @file.read
    #end
 # end

  private

   # def sanitize_filename(filename)
      # Get only the filename, not the whole path (for IE)
      # Thanks to this article I just found for the tip: http://mattberther.com/2007/10/19/uploading-files-to-a-database-using-rails
    #  return File.basename(filename)
    #end

  #  NUM_BYTES_IN_MEGABYTE = 1048576
   # def file_size_under_one_mb
    #  if (@file.size.to_f / NUM_BYTES_IN_MEGABYTE) > 1
     #   errors.add(:file, 'El archivo a subir no puede ser mayor de 1 Mb.')
      #end
   # end

end
