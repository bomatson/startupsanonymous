require 'spec_helper'

describe 'pages/home' do
  before do
    render
  end

  it 'renders "Startups Fail. All the time." in the <h1>' do
    rendered.should include 'All the time.'
  end
end
