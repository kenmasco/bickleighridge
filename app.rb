require 'sinatra'
require 'pony'

def send_email(message, subject, from)
  Pony.mail({
    :subject                => subject,
    :from                   => from,
    :body                   => "#{from} said:\n" + message,
    :to                     => 'contact@bickleighridge.com',
    :via => :smtp,
    :via_options => {
      :address              => 'smtp.gmail.com',
      :port                 => '587',
      :enable_starttls_auto => true,
      :user_name            => ENV['GMAIL_USERNAME'],
      :password             => ENV['BR_PASSWORD'],
      :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
      :domain               => "bickleighridge.com" # the HELO domain provided by the client to the server
    }
  })
end


get '/' do
  erb :index
end

post '/message' do
  send_email params['message'], params['subject'], params['email']
  redirect '/'
end

get '/partners' do
  erb :partners
end

get '/contact' do
  erb :contact
end