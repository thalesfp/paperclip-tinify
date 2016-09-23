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
      current_extension = File.extname(@file.path)
      basename = File.basename(@file.path, current_extension)

      src = @file
      dst = TempfileFactory.new.generate(basename)

      if Tinify.tinify_key
        Paperclip.log "tinifying..."

        ::Tinify.key = Tinify.tinify_key
        ::Tinify.from_file(File.expand_path(src.path)).to_file(File.expand_path(dst))

        dst
      else
        Paperclip.log "tinify key was not defined, skipping..."

        File.open(src.path)
      end
    end
  end
end