require 'spec_helper'

describe 'pages/help' do
  before do
    render
  end

  it 'renders "Help" in the <h1>' do
    rendered.should match '<h1>Help</h1>'
  end

  it 'renders "You can reach us at"' do
    rendered.should match 'You can reach us at'
  end
end