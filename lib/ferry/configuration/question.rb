module Ferry
  module Configuration
    module Question
      def initialize(key, default, options = {})
        @key, @default, @options = key, default, options
      end

      def call
        ask_question
        value_or_default
      end

      private
      attr_reader :key, :default, :options

      def ask_question
        $stdout.print question
      end

      def value_or_default
        if response.empty?
          default
        else
          response
        end
      end

      def response
        return @response if defined? @response

        @response = (gets || "").chomp
      end

      def gets
        if echo?
          $stdin.gets
        else
          $stdin.noecho(&:gets).tap{ $stdout.print "\n" }
        end
      rescue Errno::EIO
        # when stdio gets closed
      end

      def question
        I18n.t(:question, key: key, default_value: default, scope: :capistrano)
      end

      def echo?
        (options || {}).fetch(:echo, true)
      end
    end
  end
end