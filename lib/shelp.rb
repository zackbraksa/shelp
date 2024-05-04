# frozen_string_literal: true

require_relative "shelp/version"
require "thor"
require "tty-prompt"
require "openai"
require "clipboard"

module Shelp
  class ShelpCLI < Thor
    desc "ask", "Translates natural language queries into shell commands using the OpenAI API"
    def ask(query)
      client = OpenAI::Client.new(
        access_token: ENV['OPENAI_ACCESS_TOKEN'],
        log_errors: true # Highly recommended in development, so you can see what errors OpenAI is returning. Not recommended in production.
      )

      # Define the search prompt
      chat_prompt = <<~TEXT
        You are a chatbot that assists with Linux/Unix system administration tasks.
        Provide shell commands to help users with file management, system monitoring, and basic troubleshooting.
        If a user asks a question unrelated to Linux/Unix system administration, politely respond with "I'm currently focused on Linux/Unix system administration tasks. Can I help you with file management, system monitoring, or troubleshooting?"
        Always format your response in JSON format with the following structure: { "response": ["ANSWER 1", "ANSWER 2", "ANSWER 3"] }


        Generate shell commands based on the following query: #{query}

      TEXT

      # Call the OpenAI API
      chat_response = client.chat(
        parameters: {
          model: "gpt-3.5-turbo-0125", # Required.
          messages: [
            { role: "system",
              content: "You are a chatbot that assists with Linux/Unix system administration tasks. Provide shell commands to help users with file management, system monitoring, and basic troubleshooting." },
            { role: "user", content: chat_prompt }
          ],
          temperature: 0.7
        }
      )

      # Extract the chat response
      chat_reply = chat_response.dig("choices", 0, "message", "content")

      # Parse the JSON response
      chat_reply_json = JSON.parse(chat_reply)

      # Display the choices to the user
      choices = chat_reply_json["response"]

      # Copy the selected choice to the clipboard
      prompt = TTY::Prompt.new
      choice = prompt.select("Select a result:", choices)

      # Copy the selected choice to the clipboard
      Clipboard.copy(choice)

      # Display the selected choice to confirm it has been copied to the clipboard
      puts "Your choice: #{choice} has been copied to the clipboard."
    end
  end

  ShelpCLI.start(ARGV)
end
