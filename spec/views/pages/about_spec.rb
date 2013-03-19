require 'spec_helper'

describe 'pages/about' do
  before do
    render
  end

  it 'renders "About" in the <h1>' do
    rendered.should match '<h1>About</h1>'
  end

  it 'renders "We are two entrepreneurs"' do
    rendered.should match 'We are two entrepreneurs'
  end
end
