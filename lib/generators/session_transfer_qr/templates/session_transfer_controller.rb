# lib/generators/session_transfer_qr/templates/session_transfer_controller.rb
class SessionTransferController < ApplicationController
  def new
    @qr_code = SessionTransferQR::Transfer.generate_qr_code(session.to_hash)
  end

  def create
    session_data = SessionTransferQR::Transfer.decode_qr_code(params[:token])
    if session_data
      reset_session
      session.update(session_data)
      redirect_to root_path, notice: "Session transferred successfully!"
    else
      redirect_to root_path, alert: "Invalid QR code."
    end
  end
end