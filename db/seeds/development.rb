house1 = %w[1 2 3 4 5 6]
house2 = [*(7..29)]
house3 = [*(30..38)]

def google_vision_api(pic)
  require "google/cloud/vision"
  project_id = "homz-direct"
  vision = Google::Cloud::Vision.new project: project_id
  file_name = pic.attachment.url.prepend("https:").split('?')[0]
  labels = vision.image(file_name).labels
  pic.raw_json = labels.to_json

  labels.each do |label|
    if label.score > 0.80
      PictureTag.create(tag_name: label.description, rating: label.score, picture_id: pic.id)
      p "#{label.description} with score #{label.score} uploaded for #{pic.id}"
    end
  end
end

house1.each do |pic_name|
  Picture.find_or_create_by(attachment_file_name: "#{pic_name}.png") do |pic|
    pic.location = "33138"
    pic.caption = "Miami Shores/33138 - 4/5.5 - 3000 sqft - $1,800,000"
    img = File.open(File.join(Rails.root,'app','assets','images','homes',"#{pic_name}.png"))
    pic.attachment = img
    p "#{pic_name} uploaded"
  end

  pic = Picture.find_by(attachment_file_name: "#{pic_name}.png")
  google_vision_api(pic) if pic
end

house2.each do |pic_name|
  Picture.find_or_create_by(attachment_file_name: "#{pic_name}.png") do |pic|
    pic.location = "33140"
    pic.caption = "Miami Beach/33140 - 4/3 - 2550 sqft - $2,550,000"
    img = File.open(File.join(Rails.root,'app','assets','images','homes',"#{pic_name}.png"))
    pic.attachment = img
    p "#{pic_name} uploaded"
  end

  pic = Picture.find_by(attachment_file_name: "#{pic_name}.png")
  google_vision_api(pic) if pic
end

house3.each do |pic_name|
  Picture.find_or_create_by(attachment_file_name: "#{pic_name}.png") do |pic|
    pic.location = "33138"
    pic.caption = "Miami Shores/33138 - 4/3 - 2884 sqft - $1,350,000"
    img = File.open(File.join(Rails.root,'app','assets','images','homes',"#{pic_name}.png"))
    pic.attachment = img
    p "#{pic_name} uploaded"
  end

  pic = Picture.find_by(attachment_file_name: "#{pic_name}.png")
  google_vision_api(pic) if pic
end
