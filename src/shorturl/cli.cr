require "option_parser"
require "../shorturl"

module ShortURL
  class Cli
    def self.run(args = ARGV)
      url = nil
      service = :tinyurl
      verbose = false

      OptionParser.parse(args) do |parser|
        parser.banner = "Usage: shorturl [arguments]"

        parser.on("-u URL", "--url=URL", "URL to be shortened") do |u|
          url = u
        end

        parser.on("-s SERVICE", "--service=SERVICE", "Shortening service") do |s|
          service = s.strip.downcase
        end

        parser.on("-V", "--verbose", "Verbose output") do
          verbose = true
        end

        parser.on("-v", "--version", "Version") do
          puts ShortURL::VERSION
          exit 0
        end

        parser.on("-h", "--help", "Prints this help") do
          puts parser
          exit 0
        end
      end

      url = args.first if url.nil? && !args.empty?

      raise "URL is required" if url.nil?

      puts "Shortening '#{url}'" if verbose
      puts ShortURL.shorten url.not_nil!, service
    rescue e : Exception
      puts "Error: #{e.message}"
      exit 1
    end
  end
end
