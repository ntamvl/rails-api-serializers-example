require 'rails_helper'

describe V1::PostsController do
  before do
    @post = FactoryGirl.create :post
    get "/v1/posts", format: :json
  end

  it 'return post information' do
    post = JSON.parse(response.body, symbolize_names: true)[:posts].first
    ap post
    expect(post[:title]).to eql @post[:title]
    expect(post[:body]).to eql @post[:body]
  end

  it 'response code' do
    expect(response).to have_http_status(200)
  end
end
