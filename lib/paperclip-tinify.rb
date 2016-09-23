module Paperclip
  require "tinify"

  class Tinify < Processor
    class << self
      attr_accessor :tinify_key
    end

    def make
      case content_type
      when 'image/jpeg', 'image/png' then compress
      else
        @file
      end
    end

    private

    def first_processor?
      @first_processor ||= @file.is_a?(Paperclip::AbstractAdapter)
    end

    def content_type
      first_processor? ? @file.content_type : Paperclip::ContentTypeDetector.new(@file.path).detect
    end

    def compress
      src_path = File.expand_path(@file.path)

      if api_key = Tinify.tinify_key
        Paperclip.log "tinifying #{src_path}"

        ::Tinify.key = api_key
        ::Tinify.from_file(src_path).to_file(src_path)
      else
        Paperclip.log "tinify key was not defined, skipping..."
      end

      File.open(src_path)
    end
  end
end