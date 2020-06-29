table_names = %w(users
                brands
                categories
                items
                item_images
                profiles
                sending_destinations
                comments
                evaluations)
table_names.each do |table_name|
  path = Rails.root.join("db/seeds", Rails.env, table_name + ".rb")
  if File.exist?(path)
    puts "Creating #{table_name}..."
    puts path   #呼び出し先の確認
    require path
  end
end