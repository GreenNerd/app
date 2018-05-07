require_relative '../../../spec_helper'

describe Web::Controllers::Reservation::Refuse do
  let(:action) { Web::Controllers::Reservation::Refuse.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 401
  end
end
