# lib/session_transfer_qr.rb
require "rqrcode"
require "jwt"

module SessionTransferQR
  class Transfer
    SECRET_KEY = Rails.application.secret_key_base

    def self.generate_qr_code(session_data)
      token = JWT.encode(session_data, SECRET_KEY, 'HS256')
      qrcode = RQRCode::QRCode.new(token)
      qrcode.as_png(size: 300)
    end

    def self.decode_qr_code(token)
      decoded_token = JWT.decode(token, SECRET_KEY, true, { algorithm: 'HS256' })
      decoded_token.first
    rescue JWT::DecodeError
      nil
    end
  end
end