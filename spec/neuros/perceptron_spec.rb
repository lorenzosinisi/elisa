require 'spec_helper'

module Elisa
  describe Perceptron do
    subject { Perceptron.new } 
    it { expect(Perceptron.superclass).to be(Neuron) }
    context "when initialized" do
      it { expect(subject).to respond_to :layer     }
      it { expect(subject).to respond_to :bias      }
      it { expect(subject).to respond_to :inputs    }
      it { expect(subject).to respond_to :result    }
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
  context "Make a decision:" do
    
    context "with input 00" do
      let(:inputs) { { movie: Input.new(0, -2), sun: Input.new(0, -2) } }
      let(:neuron) { Perceptron.new(0, 3, inputs) }
      
      it { expect(neuron.send(:output)).to eq 1 } # yes
    end

    context "with input 01, shall I do it?" do
      let(:inputs) { { movie: Input.new(0, -2), sun: Input.new(1, -2) } }
      let(:neuron) { Perceptron.new(0, 3, inputs) }
      
      it { expect(neuron.send(:output)).to eq 1 } # yes
    end

    context "with input 11, shall I do it?" do
      let(:inputs) { { movie: Input.new(1, -2), sun: Input.new(1, -2) } }
      let(:neuron) { Perceptron.new(0, 3, inputs) }
      
      it { expect(neuron.send(:output)).to eq 0 } # no
    end
    context "float inputs:" do
      context "0.6 0.3, shall I do it?" do
        let(:inputs) { { movie: Input.new(0.6, -2), sun: Input.new(0.3, -2) } }
        let(:neuron) { Perceptron.new(0, 3, inputs) }
        
        it { expect(neuron.send(:output)).to eq 1 } # yes (as it will convert float to int so 00)
      end
    end

    context "with input 1134231, shall I do it?" do
      let(:inputs) { 
        { 
          movie:     Input.new(1, -2),
          sun:       Input.new(1, 6),
          ciccio:    Input.new(3, -2),
          color:     Input.new(4, -80),
          ivona:     Input.new(2, 1),
          somethin:  Input.new(3, 3),
          autobus:   Input.new(1, -1),
        }
      }
      let(:neuron) { Perceptron.new(0, 3, inputs) }
      it { expect(neuron.send(:output)).to eq 0 } # no
    end

    context "suppose we did have a perceptron with no inputs" do
      it "the perceptron would output 11 if b > 0" do
        neuron = Perceptron.new(0, 3)
        expect(neuron.send(:output)).to be 1
      end
      context "using #run" do
        it "the perceptron would call output" do
          neuron = Perceptron.new(0, 3)
          expect(neuron.run).to be 1
        end
      end
      it "and 00 if b ≤ 0" do
        neuron = Perceptron.new(0, -3)
        expect(neuron.send(:output)).to be 0
      end
    end

  end
end

