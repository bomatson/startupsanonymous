require 'spec_helper'

describe 'pages/about' do
  before do
    render
  end

  it 'renders "About" in the <h1>' do
    rendered.should include 'Who We Are'
  end

  it 'renders "We are two entrepreneurs"' do
    rendered.should match 'We are the ones'
  end
end
