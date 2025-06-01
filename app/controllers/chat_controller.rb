require 'httparty'
require 'dotenv/load'

class ChatController < ApplicationController
  protect_from_forgery with: :exception

  def index
  end

  def create
    return redirect_to root_path unless session[:authenticated]

    user_input = params[:prompt]
    response = HTTParty.post('https://api.openai.com/v1/chat/completions',
                             headers: {
                               "Content-Type" => "application/json",
                               "Authorization" => "Bearer #{ENV['OPENAI_API_KEY']}"
                             },
                             body: {
                               model: "gpt-4.1",
                               messages: [
                                 { role: "user", content: user_input }
                               ]
                             }.to_json
    )

    @reply = response.parsed_response["choices"]&.first&.dig("message", "content") || "Error from API"
    puts "== FORMAT: #{request.format}"

    respond_to do |format|
      format.turbo_stream {
        render turbo_stream: turbo_stream.update("chat_response", partial: "chat/response", locals: { reply: @reply })
      }
       format.html {
         render :index
       }
    end
  end

  def login
    if params[:password] == "secret123"
      session[:authenticated] = true
      redirect_to root_path
    else
      flash[:notice] = "Wrong password"
      redirect_to root_path
    end
  end

  def logout
    reset_session
    redirect_to root_path, notice: "You have been logged out."
  end

end