require 'spec_helper'
require 'rack'
require 'rack/mock'

describe 'Rack::Redirects::Middleware' do
  let(:app) do
    redirect_url = url

    Rack::Builder.new do
      use Rack::Lint
      use Rack::Redirects::Middleware do |env|
        redirect_url
      end
      run lambda { |env| [404, {}, ['Not found']] }
    end
  end

  let(:url) { nil }

  context 'with a match' do
    let(:url) { '/path' }

    it 'it respond with "moved permanently"' do
      response = Rack::MockRequest.new(app).get('/')

      expect(response.status).to eq(301)
      expect(response.headers['Location']).to eq(url)
    end
  end

  context 'with an empty string' do
    let(:url) { '' }

    it 'it respond with "gone"' do
      response = Rack::MockRequest.new(app).get('/')

      expect(response.status).to eq(410)
    end
  end

  context 'with nil' do
    it 'it respond forwards the response' do
      response = Rack::MockRequest.new(app).get('/')

      expect(response.status).to eq(404)
    end
  end
end

