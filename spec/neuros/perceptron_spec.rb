require 'spec_helper'

module Elisa
  describe Perceptron do
    subject { Perceptron.new } 
    it { expect(Perceptron.superclass).to be(Neuron) }
    context "when initialized" do
      it { expect(subject).to respond_to :layer     }
      it { expect(subject).to respond_to :bias }
      it { expect(subject).to respond_to :inputs    }
      context "without parameters" do
        it "should have layer equal to 0" do
          expect(subject.layer).to be 0
        end
        it "should have bias qual to 0" do
          expect(subject.bias).to be 0
        end
        it "should have an Hash of inputs (empty)" do
          expect(subject.inputs).to be_a Hash
        end
      end
      context "witho parameters" do
        subject { Perceptron.new(1, 2, { key: :present }) } 
        it "layer shoudl be set" do
          expect(subject.layer).to be 1
        end
        it "bias should be set" do
          expect(subject.bias).to be 2
        end
        it "inputs should be there" do
          expect(subject.inputs).to eq({ key: :present })
        end
      end
    end
  end
  context "simple decision: movie really bad and not a sunny day" do
    
    context "with input 00" do
      let(:inputs) { { movie: Input.new(0, -2), sun: Input.new(0, -2) } }
      let(:neuron) { Perceptron.new(0, 3, inputs) }
      
      it { expect(neuron.output).to eq 3 } # so positive
    end

    context "with input 01" do
      let(:inputs) { { movie: Input.new(0, -2), sun: Input.new(1, -2) } }
      let(:neuron) { Perceptron.new(0, 3, inputs) }
      
      it { expect(neuron.output).to eq 1 } # so positive
    end

    context "with input 11" do
      let(:inputs) { { movie: Input.new(1, -2), sun: Input.new(1, -2) } }
      let(:neuron) { Perceptron.new(0, 3, inputs) }
      
      it { expect(neuron.output).to eq 0 } # so positive
    end

  end
end

