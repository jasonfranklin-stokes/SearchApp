# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

x = VideoService::Search.store({ search_term: "Das rech ma" })
puts x.inspect

video_seed_data = YAML.load(File.read(Rails.root.join("db", "video_seed_data.yml")))

video_seed_data.keys.map { |k|
  s = Subject.find_or_create_by(name: video_seed_data[k]["subject"])
  Video.find_or_create_by(subject: s, title: video_seed_data[k]["title"])
}
