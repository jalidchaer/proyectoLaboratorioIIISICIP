=begin
  libreria.rb
  Autor   : Edgar Gonzalez
  Web     : http://egonzale.org
  Email   : egonzale@ucla.edu.ve
  Rails   : version 4.2.6
  Fecha   : 20 de mayo del 2016
=end

require 'openssl'
require 'base64'
# Instalar gem install gibberish
#require 'Gibberish'
require 'aesctr-ruby'

# Tomado de: http://stackoverflow.com/questions/10594616/aes-encryption-in-crypto-js-and-rails-are-giving-different-results
# Otra alternativas: http://stackoverflow.com/questions/8556940/rails-encryption-decryption
#                    http://stackoverflow.com/questions/11563105/encrypting-and-decrypting-sample-with-ruby-and-openssl
# Leer     : http://ruby-doc.org/stdlib-2.0.0/libdoc/openssl/rdoc/OpenSSL/Cipher.html
class MyAes

  def encrypt(key,text)
    begin
      #cipher = OpenSSL::Cipher.new('aes-256-ctr')
      #cipher.encrypt()
      #cipher.key = key
      #crypt = cipher.update(text) + cipher.final()
      #crypt_string = (Base64.encode64(crypt))
      #return crypt_string
      iv = Base64.decode64("kT+uMuPwUk2LH4cFbK0GiA==")
      #cipher = OpenSSL::Cipher::Cipher.new('aes-256')
      cipher = OpenSSL::Cipher::Cipher.new('aes-128-cbc')
      cipher.encrypt
      cipher.key = key
      cipher.iv = iv
      textcipher = cipher.update(text) + cipher.final
      encrypted_text = Base64.strict_encode64(textcipher)
      return encrypted_text
    rescue Exception => exc
      puts ("Message for the encryption log file for message #{text} = #{exc.message}")
    end
  end

  def decrypt(key,text)
    begin
      #cipher = OpenSSL::Cipher.new('aes-256-ctr')
      #cipher.decrypt()
      #cipher.key = key
      #tempkey = Base64.decode64(text)
      #crypt = cipher.update(tempkey)
      #crypt << cipher.final()
      #return crypt
      iv = Base64.decode64("kT+uMuPwUk2LH4cFbK0GiA==")
      #cipher = OpenSSL::Cipher::Cipher.new('aes-256-cbc')
      cipher = OpenSSL::Cipher::Cipher.new('aes-128-cbc')
      cipher.decrypt
      cipher.key = key
      cipher.iv = iv
      #tempkey = Base64.decode64(text)
      crypt = cipher.update(text)
      crypt << cipher.final()
      decrypted_text = Base64.strict_encode64(crypt)
      return decrypted_text
    rescue Exception => exc
      puts ("Message for the decryption log file for message #{text} = #{exc.message}")
    end
  end

end

# Basado en https://github.com/mdp/gibberish
class MyGibberish

  def encrypt(key, text)
   #cipher = Gibberish::AES.new(key)
   cipher = Gibberish::AES::CBC.new(key)
   cipher.encrypt(Base64.encode64(text))
  end

  def decrypt(key, text)
   #cipher = Gibberish::AES.new(key)
   cipher = Gibberish::AES::CBC.new(key)
   Base64.decode64(cipher.decrypt(text))
  end

end

=begin
 Basado en: aesctr-ruby de Diego Suarez de la implementación en PHP
            de (c) Chris Veness 2005-2011 www.movable-type.co.uk/scripts
 Descargar e instalar: https://rubygems.org/gems/aesctr-ruby
  gem install aesctr-ruby
 Documentación y Proyecto en GitHub: https://github.com/diegosuarez/aesctr-ruby
=end
class MyAesCtr
  def encrypt(key, text, bits)
    return AesCtr.encrypt(text, key, bits)
  end
  def decrypt(key, text, bits)
   return AesCtr.decrypt(text, key, bits)
  end
end
