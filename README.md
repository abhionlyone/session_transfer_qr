# Session Transfer QR

A Ruby gem for transferring sessions via QR code in Rails applications.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'session_transfer_qr'
```

And then execute:

```sh
bundle install
```

Or install it yourself as:

```sh
gem install session_transfer_qr
```

## Usage

### Step 1: Run the Generator

Run the following command to set up the necessary files in your Rails application:

```sh
rails generate session_transfer_qr:install
```

This will generate a controller (`app/controllers/session_transfer_controller.rb`) and add the required routes to your `config/routes.rb` file.

### Step 2: Display the QR Code

In your view where you want to display the QR code for session transfer, add the following code:

```erb
<%= link_to 'Transfer Session', session_transfer_new_path %>
```

This will create a link that directs users to the page displaying the QR code.

### Step 3: Scan the QR Code

On the device where you want to transfer the session, scan the QR code displayed on the original device. This will send a POST request to the `/session_transfer/create` endpoint with the encoded session data.

### Step 4: Handle the Transferred Session

The `SessionTransferController` will handle the POST request, decode the session data from the QR code, and update the session on the new device.

If the session transfer is successful, the user will be redirected to the `root_path` with a success notice. If the QR code is invalid, the user will be redirected to the `root_path` with an alert message.

## Configuration

By default, the gem uses your Rails application's `secret_key_base` to encode and decode the session data. If you want to use a different secret key, you can set it in an initializer:

```ruby
# config/initializers/session_transfer_qr.rb
SessionTransferQR::Transfer::SECRET_KEY = 'your_custom_secret_key'
```


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).