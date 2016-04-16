require 'spec_helper'

module Elisa
  describe Input do
    subject { Input.new } 
    context "when initialized" do
      it { expect(subject).to respond_to :value     }
      it { expect(subject).to respond_to :strenght  }
      context "without parameters" do
        it "should have value equal to nil" do
          expect(subject.value).to be nil
        end
        it "should have strenght qual to nil" do
          expect(subject.strenght).to be nil
        end
      end
      context "with parameters 1, 2" do
        subject { Input.new(1, 2) } 
        it "layer shoudl be set" do
          expect(subject.value).to be 1
        end
        it "strenght should be set" do
          expect(subject.strenght).to be 2
        end
      end
    end
  end
end
