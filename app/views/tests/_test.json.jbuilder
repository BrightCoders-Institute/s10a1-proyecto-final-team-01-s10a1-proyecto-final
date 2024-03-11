json.extract! test, :id, :main_image, :secondary_images, :content, :created_at, :updated_at
json.url test_url(test, format: :json)
json.main_image url_for(test.main_image)
json.secondary_images do
  json.array!(test.secondary_images) do |secondary_image|
    json.id secondary_image.id
    json.url url_for(secondary_image)
  end
end
json.content test.content.to_s
