# frozen_string_literal: true

require_relative "shelp/version"

module Shelp
  class Error < StandardError; end

  ShelpCLI.start(ARGV)
end
