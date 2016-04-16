module Elisa
  class Sigmoid < Neuron
    # Sigmoid neurons are similar to perceptrons, but modified so that small changes in 
    # their weights and bias cause only a small change in their output. 
    # That's the crucial fact which will allow a network of sigmoid neurons to learn.
    # Source http://neuralnetworksanddeeplearning.com/chap1.html
  end
end
