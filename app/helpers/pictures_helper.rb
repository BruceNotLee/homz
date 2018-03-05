module PicturesHelper
  def make_picture_path(picture)
    if request.fullpath.include? "feed"
      "pictures/#{picture.id}"
    else
      picture_path
    end
  end
end
