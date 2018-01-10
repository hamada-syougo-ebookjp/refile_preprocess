module RefilePreprocess

  # ファイルアップロード時に、process 処理適用したファイルを
  # 作成するためのプラグイン
  # 作成されるファイル名は
  #   #{refile_id}x#{processor_name}x#{options.join('x')}
  # になる
  module PreprocessAttachment
    def attachment(name, raise_errors: false, destroy: true, preprocess: nil, **options)
      super(name, raise_errors: raise_errors, destroy: destroy, **options)

      # preprocess
      attacher = "#{name}_attacher"

      preprocess&.each do |args|
        name = args.shift
        opts = args

        after_save do
          file = send(attacher).get
          return unless file.present?

          backend = file.backend

          processor  = Refile.processors.fetch(name.to_s)
          uploadable = processor&.call(file.download, *opts)

          if backend.is_a?(Refile::S3) && uploadable.present?
            backend.object("#{file.id}x#{name}x#{opts.join('x')}").put(body: uploadable, content_length: uploadable.size)
          end
        end

        after_destroy do
          file = send(attacher).get
          return unless file.present?

          backend = file.backend

          if backend.is_a?(Refile::S3)
            backend.object("#{file.id}x#{name}x#{opts.join('x')}").delete
          end
        end
      end
    end
  end
end
