spinner = TTY::Spinner.new('[:spinner] Cadastrando Moedas...')
spinner.auto_spin
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
spinner.success('com suecesso')
