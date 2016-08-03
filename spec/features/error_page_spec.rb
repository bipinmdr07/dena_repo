context '404' do
  before do
    method = Rails.application.method(:env_config)
    expect(Rails.application).to receive(:env_config).with(no_args()) do
      method.call.merge(
        'action_dispatch.show_exceptions' => true,
        'action_dispatch.show_detailed_exceptions' => false
      )
    end
  end
  
  it 'returns appropriate status code and content' do
    visit '/not-a-real-page'
    expect(page.status_code).to eql 404
    expect(page).to have_content 'Sorry'
  end
end