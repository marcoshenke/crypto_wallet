namespace :dev do
  desc 'Configura o ambiente de desenvolvimento'
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando banco de dados...') { `rails db:drop` }
      show_spinner('Criando banco de dados...') { `rails db:create` }
      show_spinner('Migrando banco de dados...') { `rails db:migrate` }
      show_spinner('Populando banco de dados...') { `rails db:seed` }
    end
  end

  private

  def show_spinner(msg_start, msg_end = 'concluído')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")
  end
end
