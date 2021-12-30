# frozen_string_literal: true

class Post < ActiveRecord::Base
  enum status: { unpublished: 1, published: 2 }
end

class Comment < ActiveRecord::Base
  enum status: { unpublished: false, published: true }, _prefix: true
end

module Schema
  class << self
    def create # rubocop:disable Metrics/MethodLength
      ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
      ActiveRecord::Migration.verbose = false
      ActiveRecord::Schema.define do
        create_table :posts, force: true do |t|
          t.string :title, null: false
          t.string :body, null: false
          t.integer :status, null: false, default: 1
          t.timestamps null: false
        end
        create_table :comments, force: true do |t|
          t.string :body, null: false
          t.boolean :status, null: false, default: 1
          t.timestamps null: false
        end
      end
    end
  end
end
