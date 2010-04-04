require 'ftools'

class Media < ActiveRecord::Base
  belongs_to :user


  # allows to upload a new file on the server, and to create the media
  # associated to this file. 

  # TODO check if a file with this file_name already exist before uploading
  # the new file. If a file with this filename already exists, should NOT
  # upload the file
  def self.upload_file(upload, uid)
    name = upload.original_filename
    directory = "./public/medias"

    # Each media is uploaded in a directory of the year, then the months.
    # Example: a file uploaded 2010/09/23 is in the folder
    # ./tmp/fichier/2010/09

    year = Time.now.year
    month = Time.now.month
    path = File.join(directory, year.to_s, month.to_s)
    File.makedirs(path)

    path = File.join(path, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload.read) }
    # We can now save the media in the database
    media = Media.new
    media.file_name = name
    media.user_id = uid
    media.save
  end

  # generates the path linked to a media
  def generates_path
    return File.join("./medias", self.created_at.year.to_s,
    self.created_at.month.to_s, self.file_name)
  end


end
