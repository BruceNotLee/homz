house1 = %w[1 2 3 4 5 6]
house2 = [*(7..29)]

house1.each do |pic_name|
  Picture.find_or_create_by(attachment_file_name: "#{pic_name}.png") do |pic|
    pic.location = "33138"
    pic.caption = "Miami Shores/33138 - 4/5.5 - 3000 sqft - $1,800,000"
    img = File.open(File.join(Rails.root,'app','assets','images','homes',"#{pic_name}.png"))
    pic.attachment = img
    p "#{pic_name} uploaded"
  end
end

house2.each do |pic_name|
  Picture.find_or_create_by(attachment_file_name: "#{pic_name}.png") do |pic|
    pic.location = "33140"
    pic.caption = "Miami Beach/33140 - 4/3 - 2550 sqft - $2,550,000"
    img = File.open(File.join(Rails.root,'app','assets','images','homes',"#{pic_name}.png"))
    pic.attachment = img
    p "#{pic_name} uploaded"
  end
end
