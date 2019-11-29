# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ransack::Enum do
  describe 'where status values' do
    let(:cond) { { status_eq: 'published' } }
    let(:search) { Post.ransack(cond) }
    subject { search.result.where_values_hash['status'] }
    context 'status eq unpublished' do
      let(:cond) { { status_eq: 'unpublished' } }
      it { is_expected.to eq 0 }
    end
    context 'status eq published' do
      let(:cond) { { status_eq: 'published' } }
      it { is_expected.to eq 1 }
    end
    context 'status in [unpublished, published]' do
      let(:cond) { { status_in: %w[unpublished published] } }
      it { is_expected.to eq [0, 1] }
    end
    context 'status eq 0' do
      let(:cond) { { status_eq: 0 } }
      it { is_expected.to eq 0 }
    end
    context 'status eq 1' do
      let(:cond) { { status_eq: 1 } }
      it { is_expected.to eq 1 }
    end
    context 'status in [0, 1]' do
      let(:cond) { { status_in: [0, 1] } }
      it { is_expected.to eq [0, 1] }
    end
  end
end
