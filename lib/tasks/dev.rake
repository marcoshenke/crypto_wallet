namespace :dev do
  desc 'Configura o ambiente de desenvolvimento'
  task setup: :environment do
    if Rails.env.development?
      spinner = TTY::Spinner.new('[:spinner] Configurando ambiente')
      spinner.auto_spin
      `rails db:drop db:create db:migrate db:seed`
      spinner.success('concluído com sucesso!')
    else
      puts 'Você não está em ambiente de desenvolvimento'
    end
  end
end
