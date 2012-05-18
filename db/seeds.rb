# encoding: utf-8

['all', Rails.env].each do |seed_file|
  seed = "#{Rails.root}/db/seeds/#{seed_file}.rb"
  require seed if File.exists?(seed)
end
