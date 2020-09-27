# frozen_string_literal: true

RSpec.describe Ransack::Enum do
  subject { klass.ransack(cond).result.where_values_hash['status'] }

  shared_context 'when ransack enum enabled' do
    let(:enabled) { true }
  end

  shared_context 'when ransack enum disabled' do
    let(:enabled) { false }
  end

  before do
    Ransack::Enum.configure do |config|
      config.enabled = enabled
    end
  end

  context 'when key is symbol' do
    let(:klass) { Post }

    it_behaves_like 'when ransack enum enabled' do
      context 'when status eq unpublished' do
        let(:cond) { { status_eq: 'unpublished' } }

        it { is_expected.to eq 1 }
      end

      context 'when status eq published' do
        let(:cond) { { status_eq: 'published' } }

        it { is_expected.to eq 2 }
      end

      context 'when status in [unpublished, published]' do
        let(:cond) { { status_in: %w[unpublished published] } }

        it { is_expected.to eq [1, 2] }
      end

      context 'when status eq 1' do
        let(:cond) { { status_eq: 1 } }

        it { is_expected.to eq 1 }
      end

      context 'when status eq 2' do
        let(:cond) { { status_eq: 2 } }

        it { is_expected.to eq 2 }
      end

      context 'when status in [1, 2]' do
        let(:cond) { { status_in: [1, 2] } }

        it { is_expected.to eq [1, 2] }
      end
    end

    it_behaves_like 'when ransack enum disabled' do
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

  context 'key is string' do
    let(:klass) { Comment }

    it_behaves_like 'when ransack enum enabled' do
      context 'status eq unpublished' do
        let(:cond) { { status_eq: 'unpublished' } }

        it { is_expected.to eq false }
      end

      context 'status eq published' do
        let(:cond) { { status_eq: 'published' } }

        it { is_expected.to eq true }
      end

      context 'status in [unpublished, published]' do
        let(:cond) { { status_in: %w[unpublished published] } }

        it { is_expected.to eq [false, true] }
      end

      context 'status eq 1' do
        let(:cond) { { status_eq: false } }

        it { is_expected.to eq false }
      end

      context 'status eq 2' do
        let(:cond) { { status_eq: true } }

        it { is_expected.to eq true }
      end

      context 'status in [1, 2]' do
        let(:cond) { { status_in: [false, true] } }

        it { is_expected.to eq [false, true] }
      end
    end
  end
end
