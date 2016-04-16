module Elisa
  class Perceptron < Neuron
    attr_accessor :layer, :bias, :inputs
    
    def initialize(layer = 0, bias = 0, inputs = {})
      @layer, @bias, @inputs = layer, bias, inputs
    end

    def output
      sum = 0 + bias
      inputs.each do |name, input|
        sum += input.strenght * input.value
      end

      sum > 0 ? sum : 0
    end
  end
end
