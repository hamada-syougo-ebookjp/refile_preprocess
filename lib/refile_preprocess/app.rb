module RefilePreprocess
  module App
    # for lazy process
    class SkippableProcessor
      def initialize(name, &block)
        @name  = name
        @block = block
      end

      def call(file, *args, format: nil, &block)
        if file.respond_to?(:skippable)
          file
        else
          # call default processor#call
          @block.call.call(file, *args, format: format, &block)
        end
      end
    end


    # preprocess 済みのファイルがあれば
    # そのファイルを返す
    # endpoint: processor.call(file, ...)
    def file
      if backend.is_a?(Refile::S3) && params[:processor].present?
        id   = params[:id]
        name = params[:processor]
        args = params[:splat]&.first&.split('/')

        file = backend.get("#{id}x#{name}x#{args&.join('x')}")

        if file.exists?
          uploadable = file.download
          def uploadable.skippable; true; end  # mark skippable object
          return uploadable
        end
      end

      super
    end

    def processor
      SkippableProcessor.new(params[:processor]) do
        super
      end
    end
  end
end

