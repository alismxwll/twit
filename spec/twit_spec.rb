require 'rails_helper'

describe Twit do
  it { should belong_to :user }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :content }
end
