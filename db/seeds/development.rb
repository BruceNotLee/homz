#find or create by
pics = %w[1 2 3 4 5 6]

pics.each do |pic_name|
  Picture.find_or_create_by(attachment_file_name: "#{pic_name}.png") do |pic|
    pic.location = "33138"
    img = File.open(File.join(Rails.root,'app','assets','images',"#{pic_name}.png"))
    pic.attachment = img
    p "#{pic_name} uploaded"
  end
end
