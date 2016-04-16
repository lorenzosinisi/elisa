module Elisa
  class ElisaError < Exception
    def initialize(message)
      super(message)
    end
  end
end
