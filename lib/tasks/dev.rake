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

  desc 'Cadastra as moedas'
  task add_coins: :environment do
    show_spinner('Cadastrando Moedas') do
      coins = [
        {
          description: 'Bitcoin',
          acronym: 'BTC',
          url_image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRExYxzyLPvZICpw3iTO9D6v1NJj7RfAmPPqg&usqp=CAU'
        },
        {
          description: 'Etherum',
          acronym: 'ETH',
          url_image: 'https://cryptologos.cc/logos/ethereum-eth-logo.png'
        },
        {
          description: 'Dash',
          acronym: 'DASH',
          url_image: 'https://cryptologos.cc/logos/dash-dash-logo.png'
        }
      ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
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
