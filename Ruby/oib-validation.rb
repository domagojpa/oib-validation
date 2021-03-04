def check_oib(oib)
  oib = oib.to_s
  
  return false unless oib.match(/^[0-9]{11}$/)
  
  # provjera kontrolne znamenke: ISO7064, MOD 11,10 - Hibridni sistem
  kontrolna_suma = (0..9).inject(10) do |medjurezultat, pozicija|
    medjurezultat += oib.at(pozicija).to_i
    medjurezultat %= 10
    medjurezultat = 10 if medjurezultat == 0
    medjurezultat *= 2
    medjurezultat %= 11
  end
  
  kontrolna_suma = 11 - kontrolna_suma
  kontrolna_suma = 0 if kontrolna_suma == 10
  
  return kontrolna_suma == oib.at(10).to_i end
