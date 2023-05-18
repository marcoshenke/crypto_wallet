namespace :dev do
  desc 'TODO'
  task setup: :environment do
    puts `rails db:drop db:create db:migrate db:sedd`
  end
end
