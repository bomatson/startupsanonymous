require 'spec_helper'

describe 'pages/home' do

  it 'renders "Startups Fail. All the time." in the <h1>' do
    visit '/'
    page.should have_content 'All the time.'
  end
end
