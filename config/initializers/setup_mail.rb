ActionMailer::Base.smtp_settings = {

  :address => "127.0.0.1",
  :port    => 25,
  :domain  => 'thepouitree.com'
}


ActionMailer::Base.default_url_options[:host] = "thepouitree.com"
