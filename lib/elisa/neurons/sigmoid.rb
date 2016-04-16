module Elisa
  class Sigmoid < Neuron
    # Sigmoid neurons are similar to perceptrons, but modified so that small changes in 
    # their weights and bias cause only a small change in their output. 
    # That's the crucial fact which will allow a network of sigmoid neurons to learn.
    # Source http://neuralnetworksanddeeplearning.com/chap1.html
    attr_accessor :layer, :bias, :inputs
    attr_reader :result
    
    def initialize(layer = 0, bias = 0, inputs = {})
      @layer, @bias, @inputs = layer, bias, inputs
    end

    def run
      output
    end
    
    private

    def validate_value(v)
      raise ElisaError, "Sigmoid neurons accept only values between 0 and 1" if v.to_f > 1.0
      raise ElisaError, "Sigmoid neurons accept only values between 0 and 1" if v.to_f < 0.0
    end
    
    def output
      sum = 0 + bias
      inputs.each do |name, input|
        validate_value(input.value.to_f)
        sum += input.strenght * input.value.to_f
      end

      @result = sum >= 0 ? 1 : 0
    end
  end
end
