module Elisa
  class Input
    attr_accessor :value, :strenght
    def initialize(value = nil, strenght = nil)
      @value, @strenght = value, strenght
    end

  end
end
