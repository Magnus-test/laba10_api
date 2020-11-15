require 'test_helper'

class XmlControllerTest < ActionDispatch::IntegrationTest
  # test "should get index" do
  #   get xml_index_url
  #   assert_response :success
  # end

  test "get rss format" do
    get '/', params: { val: '35', format: :rss }
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'application/rss'
  end

end
