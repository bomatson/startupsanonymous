require 'spec_helper'

describe 'pages/help' do
  before do
    render
  end

  it 'renders "Help" in the <h1>' do
    rendered.should include 'help'
  end

  it 'renders "If you leave your email"' do
    rendered.should match 'If you leave your email'
  end
end