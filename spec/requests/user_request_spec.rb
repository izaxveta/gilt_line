require 'rails_helper'

RSpec.describe 'User API' do
  it 'can POST a new user' do
    expect(User.count).to eq(0)
    post '/api/v1/users', params: { user: { first_name: 'Stella',
                                            last_name: 'Harvenheit',
                                            email: 'stella@mail.com',
                                            password: 'password'
                                  }}

    content = JSON.parse(response.body)
    expect(response.status).to eq(201)
    expect(User.count).to eq(1)
    expect(content['user']['first_name']).to eq('Stella')
  end
end