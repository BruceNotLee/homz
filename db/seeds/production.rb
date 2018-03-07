house1 = %w[1 2 3 4 5 6]
house1info = {location: "33138", caption: "Miami Shores/33138 - 4/5.5 - 3000 sqft - $1,800,000", user_id: 1}
house2 = [*(7..29)]
house2info = {location: "33140", caption: "Miami Beach/33140 - 4/3 - 2550 sqft - $2,550,00000", user_id: 2}
house3 = [*(30..38)]
house3info = {location: "33138", caption: "Miami Shores/33138 - 4/3 - 2884 sqft - $1,350,000", user_id: 3}
house4 = %w[39 40 41]
house4info = {location: "33150", caption: "Miami Shores/33150 - 3/2 - 1995 sqft - $499,000", user_id: 4}
house5 = [*(42..49)]
house5info = {location: "33138", caption: "Miami Shores/33138 - 3/2 - 2241 sqft - $680", user_id: 5}
house6 = [*(50..54)]
house6info = {location: "33138", caption: "Miami Shores/33138 - 2/2 - 1524 sqft - $750,000", user_id: 6}

zips = [33138,33140,33150]
if User.count < 6
  6.times do
    User.create(email: Faker::Internet.safe_email, password:'password',password_confirmation:'password', location: zips.sample)
  end

  pic = Picture.find_by(attachment_file_name: "#{pic_name}.png")
  google_vision_api(pic) if pic
end


def google_vision_api(pic)
  p "inside google vision"
  require "google/cloud/vision"
  project_id = "homz-direct"
  vision = Google::Cloud::Vision.new project: project_id
  file_name = pic.attachment.url.prepend("https:").split('?')[0]
  labels = vision.image(file_name).labels
  pic.raw_json = labels.to_json

  labels.each do |label|
    if label.score > 0.80
      PictureTag.find_or_create_by(picture_id: pic.id, tag_name: label.description) do |tag|
        tag.tag_name = label.description
        tag.rating = label.score
        tag.picture_id = pic.id
        p "#{label.description} with score #{label.score} uploaded for #{pic.id}"
      end
    end
  end

  pic = Picture.find_by(attachment_file_name: "#{pic_name}.png")
  google_vision_api(pic) if pic
end

def seed_database(pic_names,houseInfo)
  pic_names.each do |pic_name|
    Picture.find_or_create_by(attachment_file_name: "#{pic_name}.png") do |pic|
      pic.location = houseInfo[:location]
      pic.caption = houseInfo[:caption]
      img = File.open(File.join(Rails.root,'app','assets','images','homes',"#{pic_name}.png"))
      pic.attachment = img
      pic.user_id = houseInfo[:user_id]
      p "#{pic_name} uploaded"
    end

    pic = Picture.find_by(attachment_file_name: "#{pic_name}.png")
    google_vision_api(pic) if pic
  end
end

seed_database(house1,house1info)
seed_database(house2,house2info)
seed_database(house3,house3info)
seed_database(house4,house4info)
seed_database(house5,house5info)
seed_database(house6,house6info)
