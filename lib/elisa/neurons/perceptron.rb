module Elisa
  class Perceptron < Neuron
    attr_accessor :layer, :bias, :inputs
    attr_reader :result
    
    def initialize(layer = 0, bias = 0, inputs = {})
      @layer, @bias, @inputs = layer, bias, inputs
    end

    def run
      return output
    end
    
    private
    
    def output
      sum = 0 + bias
      inputs.each { |name, input| sum += input.strenght * input.value.to_i }
      @result = sum >= 0 ? 1 : 0
    end
  end
end
