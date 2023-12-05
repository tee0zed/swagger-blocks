module Swagger
  module Utils

    module ClassMethods
      def concatenated(&block)
        @concatenated_block = block
      end

      def concatenate(base)
        base.class_exec &@concatenated_block if @concatenated_block
      end

      def concat(mod)
        self.extend mod
        mod.concatenate(self)
      end
    end

    def self.included(base)
      base.extend ClassMethods
    end
  end
end
