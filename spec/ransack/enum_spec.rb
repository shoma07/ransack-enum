# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ransack::Enum do
  let(:enabled) { true }

  before do
    Ransack::Enum.configure do |config|
      config.enabled = enabled
    end
  end

  context 'key is symbol' do
    describe 'where status values' do
      let(:cond) { { status_eq: 'published' } }
      let(:search) { Post.ransack(cond) }
      subject { search.result.where_values_hash['status'] }
      context 'enabled' do
        let(:enabled) { true }
        context 'status eq unpublished' do
          let(:cond) { { status_eq: 'unpublished' } }
          it { is_expected.to eq 1 }
        end
        context 'status eq published' do
          let(:cond) { { status_eq: 'published' } }
          it { is_expected.to eq 2 }
        end
        context 'status in [unpublished, published]' do
          let(:cond) { { status_in: %w[unpublished published] } }
          it { is_expected.to eq [1, 2] }
        end
        context 'status eq 1' do
          let(:cond) { { status_eq: 1 } }
          it { is_expected.to eq 1 }
        end
        context 'status eq 2' do
          let(:cond) { { status_eq: 2 } }
          it { is_expected.to eq 2 }
        end
        context 'status in [1, 2]' do
          let(:cond) { { status_in: [1, 2] } }
          it { is_expected.to eq [1, 2] }
        end
      end
      context 'disabled' do
        let(:enabled) { false }
        context 'status eq unpublished' do
          let(:cond) { { status_eq: 'unpublished' } }
          it { is_expected.to eq 0 }
        end
        context 'status eq published' do
          let(:cond) { { status_eq: 'published' } }
          it { is_expected.to eq 0 }
        end
        context 'status in [unpublished, published]' do
          let(:cond) { { status_in: %w[unpublished published] } }
          it { is_expected.to eq [0, 0] }
        end
        context 'status eq 1' do
          let(:cond) { { status_eq: 1 } }
          it { is_expected.to eq 1 }
        end
        context 'status eq 2' do
          let(:cond) { { status_eq: 2 } }
          it { is_expected.to eq 2 }
        end
        context 'status in [1, 2]' do
          let(:cond) { { status_in: [1, 2] } }
          it { is_expected.to eq [1, 2] }
        end
      end
    end
  end
  context 'key is string' do
    describe 'where status values' do
      let(:cond) { { status_eq: 'published' } }
      let(:search) { Comment.ransack(cond) }
      subject { search.result.where_values_hash['status'] }
      context 'enabled' do
        let(:enabled) { true }
        context 'status eq unpublished' do
          let(:cond) { { status_eq: 'unpublished' } }
          it { is_expected.to eq 1 }
        end
        context 'status eq published' do
          let(:cond) { { status_eq: 'published' } }
          it { is_expected.to eq 2 }
        end
        context 'status in [unpublished, published]' do
          let(:cond) { { status_in: %w[unpublished published] } }
          it { is_expected.to eq [1, 2] }
        end
        context 'status eq 1' do
          let(:cond) { { status_eq: 1 } }
          it { is_expected.to eq 1 }
        end
        context 'status eq 2' do
          let(:cond) { { status_eq: 2 } }
          it { is_expected.to eq 2 }
        end
        context 'status in [1, 2]' do
          let(:cond) { { status_in: [1, 2] } }
          it { is_expected.to eq [1, 2] }
        end
      end
    end
  end
end
